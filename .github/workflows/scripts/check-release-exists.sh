#!/usr/bin/env bash
set -euo pipefail

# check-release-exists.sh
# Check if a GitHub release already exists
# Usage: check-release-exists.sh <version>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1

# Check if release exists using GitHub API
RELEASE_EXISTS=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
    "https://api.github.com/repos/$GITHUB_REPOSITORY/releases/tags/$VERSION" \
    | jq -r '.message // "ok"')

if [ "$RELEASE_EXISTS" = "Not Found" ]; then
    echo "exists=false" >> $GITHUB_OUTPUT
    echo "Release $VERSION does not exist"
else
    echo "exists=true" >> $GITHUB_OUTPUT
    echo "Release $VERSION already exists"
fi