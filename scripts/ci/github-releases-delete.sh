#!/bin/bash
###################################################################
# Script Name  : github-releases-delete.sh
# Description  : This script deletes all GitHub releases in a repository.
# Args         : --limit (optional) - The maximum number of releases to fetch.
###################################################################

# Default limit
LIMIT=100

# Parse optional arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
  --limit)
    LIMIT="$2"
    shift
    ;;
  *)
    echo "Unknown parameter passed: $1"
    exit 1
    ;;
  esac
  shift
done

# Ensure the GitHub CLI is authenticated
gh auth login --with-token <(echo "$GITHUB_TOKEN")

echo "Fetch all releases (limit: $LIMIT)..."
releases=$(gh release list --limit "$LIMIT" --json tagName --jq '.[].tagName')

# Loop through each release and delete it
count=0
for release in $releases; do
  echo "Deleting release: $release"
  gh release delete "$release" --yes
  count=$((count + 1))
done

echo "All $count releases have been deleted."
