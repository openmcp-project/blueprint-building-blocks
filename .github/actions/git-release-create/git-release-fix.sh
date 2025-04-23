#!/bin/bash
###################################################################
# Script Name  : github release create
# Description  : This script fetches all Git tags, checks if a GitHub release already exists for
#               each tag, and if not, generates release notes and creates a new GitHub release
#               for the tag. It searches for a previous tag that starts with the same name as the
#               current tag but has a lower semantic version.
# Args         : -
# Hint         : This script is not meant for any pipeline just for cleanup!
###################################################################
set +e

# Fetch all tags from the remote
gh auth status

git fetch --tags

# Get all tags
tags=$(git tag)

# Fetch all existing releases
existing_releases=$(gh release list --limit 99999 --json tagName --jq '.[].tagName')

# Loop through each tag
for tag in $tags; do
  if echo "$existing_releases" | grep -q "^$tag$"; then
    echo "Release for tag $tag already exists. Skipping..."
    continue
  fi

  # Find the previous tag with the same prefix but lower semantic version
  previous_tag=""
  prefix=""
  prefix=$(echo "$tag" | sed -E 's/([0-9]+\.[0-9]+\.[0-9]+)$//')
  previous_tag=$(git tag -l "${prefix}*" | sort -V | grep -B1 "$tag" | head -n 1)

  release_notes=""
  # Generate release notes using the GitHub CLI
  if [ -n "$previous_tag" ] && [ "$previous_tag" != "$tag" ]; then
    release_notes=$(gh api repos/:owner/:repo/releases/generate-notes -f tag_name="$tag" -f previous_tag_name="$previous_tag" -q '.body')
    printf 'tag: %s != previous_tag: %s \n %s' "$tag" "$previous_tag" "$release_notes"
  else
    release_notes=$(gh api repos/:owner/:repo/releases/generate-notes -f tag_name="$tag" -q '.body')
    printf 'tag: %s == previous_tag: %s \n %s' "$tag" "$previous_tag" "$release_notes"
  fi

  # Create a release for each tag
  gh release create "$tag" --title "$tag" --notes "$release_notes" --verify-tag --latest=false

done
