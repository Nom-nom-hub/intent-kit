#!/bin/bash
# release.sh - Automated release script for Intent-Kit

set -e  # Exit on any error

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new-version>"
    echo "Example: $0 0.0.3"
    exit 1
fi

NEW_VERSION=$1
CURRENT_BRANCH=$(git branch --show-current)

echo "Starting automated release for version $NEW_VERSION on branch $CURRENT_BRANCH"

# Validate version format (should be x.y.z)
if ! [[ $NEW_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version must be in the format x.y.z (e.g., 0.0.3)"
    exit 1
fi

echo "Validated version format: $NEW_VERSION"

# Update the version in pyproject.toml
echo "Updating version in pyproject.toml to $NEW_VERSION..."
python -c "
import re
with open('pyproject.toml', 'r') as f:
    content = f.read()

# Replace the version line
content = re.sub(r'^version = \".*\"$', f'version = \"{NEW_VERSION}\"', content, flags=re.MULTILINE)

with open('pyproject.toml', 'w') as f:
    f.write(content)
"

# Create the release commit
COMMIT_MSG="Release v$NEW_VERSION

- Updated version in pyproject.toml
- Automated release commit
"
echo "Creating release commit..."
git add pyproject.toml
git commit -m "$COMMIT_MSG"

# Create and push the tag
echo "Creating and pushing tag v$NEW_VERSION..."
git tag "v$NEW_VERSION"
git push origin "v$NEW_VERSION"

echo "Release v$NEW_VERSION has been created and pushed!"
echo "GitHub Actions will now create the release automatically."