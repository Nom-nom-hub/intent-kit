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

# Install build module if not already available
python -m pip install build

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

# Create and use .genreleases directory for agent template build artifacts
GENRELEASES_DIR=".genreleases"
mkdir -p "$GENRELEASES_DIR"
rm -rf "$GENRELEASES_DIR"/* || true

# Define AI agents to create templates for
AGENTS=("copilot" "claude" "gemini" "cursor" "qwen" "opencode" "codex" "windsurf" "kilocode" "auggie" "roo" "codebuddy" "q")

# For each agent, create an agent-specific templates directory
for agent in "${AGENTS[@]}"; do
  # Create directories for different script types
  mkdir -p "$GENRELEASES_DIR/idd-${agent}-package-sh"
  mkdir -p "$GENRELEASES_DIR/idd-${agent}-package-ps"
  
  # Copy all templates to agent-specific directories
  cp -r templates/* "$GENRELEASES_DIR/idd-${agent}-package-sh/" 2>/dev/null || echo "No templates to copy for sh"
  cp -r templates/* "$GENRELEASES_DIR/idd-${agent}-package-ps/" 2>/dev/null || echo "No templates to copy for ps"
  
  # Create archives for each agent and script type
  if [ -d "$GENRELEASES_DIR/idd-${agent}-package-sh" ] && [ "$(ls -A $GENRELEASES_DIR/idd-${agent}-package-sh)" ]; then
    (cd "$GENRELEASES_DIR" && zip -r "intent-kit-template-${agent}-sh-${VERSION}.zip" "idd-${agent}-package-sh/")
  fi
  
  if [ -d "$GENRELEASES_DIR/idd-${agent}-package-ps" ] && [ "$(ls -A $GENRELEASES_DIR/idd-${agent}-package-ps)" ]; then
    (cd "$GENRELEASES_DIR" && zip -r "intent-kit-template-${agent}-ps-${VERSION}.zip" "idd-${agent}-package-ps/")
  fi
done

echo "Generated template archives in $GENRELEASES_DIR:"
ls -1 "$GENRELEASES_DIR"/intent-kit-template-*-"$VERSION".zip