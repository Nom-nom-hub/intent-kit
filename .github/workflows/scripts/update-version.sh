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

# Add all modified files
git add pyproject.toml CHANGELOG.md

# Add any other relevant files that might have been modified
if [ -f "intent_kit-*.whl" ] || [ -f "intent_kit-*.tar.gz" ]; then
    git add intent_kit-*.whl intent_kit-*.tar.gz 2>/dev/null || true
fi

# Add release note files if they exist
git add release_notes.txt formatted_release_notes.txt 2>/dev/null || true

# Commit with all changes
git commit -m "chore: update version to $VERSION"

# Only push if we're not in detached HEAD state
if [[ $(git rev-parse --abbrev-ref HEAD) != "HEAD" ]]; then
    git push origin main
else
    echo "In detached HEAD state, skipping direct push to main"
fi