#!/usr/bin/env bash
set -euo pipefail

# generate-release-notes.sh
# Generate release notes for the new release
# Usage: generate-release-notes.sh <new_version> <previous_tag>

if [ $# -ne 2 ]; then
    echo "Usage: $0 <new_version> <previous_tag>"
    exit 1
fi

NEW_VERSION=$1
PREVIOUS_TAG=$2

echo "Generating release notes for $NEW_VERSION"

# Get commit messages between the previous tag and current HEAD
if [ "$PREVIOUS_TAG" != "v0.0.0" ]; then
    git log --oneline --no-merges $PREVIOUS_TAG..HEAD > release_notes.txt
else
    git log --oneline --no-merges HEAD~10..HEAD > release_notes.txt
fi

# Format the release notes
echo "## Release $NEW_VERSION" > formatted_release_notes.txt
echo "" >> formatted_release_notes.txt
cat release_notes.txt >> formatted_release_notes.txt

# Output the release notes for GitHub Actions
echo "RELEASE_NOTES<<EOF" >> $GITHUB_ENV
cat formatted_release_notes.txt >> $GITHUB_ENV
echo "EOF" >> $GITHUB_ENV