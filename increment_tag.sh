#!/bin/bash

# Get the latest tag version
latest_tag=$(git describe --tags --abbrev=0)

# Split the tag into parts
IFS='.' read -ra tag_parts <<< "$latest_tag"

# Extract the patch version and increment it
patch_version=${tag_parts[2]}
patch_version=$((patch_version + 1))

# Concatenate the tag parts back
new_tag="${tag_parts[0]}.${tag_parts[1]}.$patch_version"

# Create the new tag
git tag "$new_tag"

# Push the new tag to remote
git push origin "$new_tag"
