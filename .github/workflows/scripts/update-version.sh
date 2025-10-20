#!/usr/bin/env bash
set -euo pipefail

# update-version.sh
# Update the version in pyproject.toml
# Usage: update-version.sh <version>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1
VERSION_NUMBER=${VERSION#v}  # Remove 'v' prefix if present

echo "Updating version in pyproject.toml to $VERSION_NUMBER"

# Update version in pyproject.toml
sed -i.bak "s/version = \".*\"/version = \"$VERSION_NUMBER\"/" pyproject.toml && rm pyproject.toml.bak

# Commit the change
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"
git add pyproject.toml
git commit -m "chore: update version to $VERSION"

# Only push if we're not in detached HEAD state
if [[ $(git rev-parse --abbrev-ref HEAD) != "HEAD" ]]; then
    git push origin main
else
    echo "In detached HEAD state, skipping direct push to main"
fi