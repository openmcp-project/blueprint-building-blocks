#!/bin/bash
###################################################################
#Script Name  : Renaming Git Tags
#Description  : Renames Git Tags with "/" to "-"
#Args         : -
#Hint         : This script is not meant for any pipeline just for cleanup!
###################################################################
# Fetch all tags from the remote
git fetch --tags

# Get all tags
tags=$(git tag)

# Loop through each tag
for tag in $tags; do
  # Check if the tag contains "/"
  if [[ "$tag" == *"/"* ]]; then
    # Replace "/" with "-"
    new_tag=$(echo "$tag" | tr '/' '-')
    echo "new: $new_tag old: $tag"
    # Rename the tag
    git tag "$new_tag" "$tag"
    git tag -d "$tag"
    git push origin :"$tag"
    git push origin "$new_tag"
  fi
done
