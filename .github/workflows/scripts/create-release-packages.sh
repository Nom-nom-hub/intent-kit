#!/usr/bin/env bash
set -euo pipefail

# create-release-packages.sh
# Create release packages for distribution
# Usage: create-release-packages.sh <version>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1
ASSET_VERSION=${VERSION#v}  # Remove 'v' prefix if present

echo "Creating release packages for version $VERSION"

# Build the Python package
python -m build

# Create archives for distribution
if [ -d "dist" ] && [ "$(ls -A dist)" ]; then
    # Create archives with version information
    cp dist/* ./
    # Rename files to include version information
    for file in intent-kit-*.whl intent-kit-*.tar.gz; do
        if [ -f "$file" ]; then
            mv "$file" "intent-kit-${ASSET_VERSION}.zip"
        fi
    done
fi