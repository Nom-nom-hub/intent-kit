#!/usr/bin/env bash
set -euo pipefail

# create-github-release.sh
# Create a GitHub release with assets
# Usage: create-github-release.sh <version>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1

# Ensure the tag name starts with 'v' to be a valid git tag
if [[ $VERSION != v* ]]; then
    TAG_NAME="v$VERSION"
else
    TAG_NAME="$VERSION"
fi

# Create the release using GitHub API
curl -s -X POST \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"tag_name\": \"$TAG_NAME\",
        \"target_commitish\": \"main\",
        \"name\": \"Release $VERSION\",
        \"body\": \"Automated release\",
        \"draft\": false,
        \"prerelease\": false
    }" \
    "https://api.github.com/repos/$GITHUB_REPOSITORY/releases"