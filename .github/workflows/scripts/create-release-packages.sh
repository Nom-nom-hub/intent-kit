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

# Define AI agents to create templates for
AGENTS=("copilot" "claude" "gemini" "cursor" "qwen" "opencode" "codex" "windsurf" "kilocode" "auggie" "roo" "codebuddy" "q")

# Create templates directory if it doesn't exist
mkdir -p templates_for_agents

# For each agent, create an agent-specific templates directory
for agent in "${AGENTS[@]}"; do
  # Create directories for different script types
  mkdir -p "templates_for_agents/${agent}/sh"
  mkdir -p "templates_for_agents/${agent}/ps"
  
  # Copy all templates to agent-specific directories
  cp -r templates/* "templates_for_agents/${agent}/sh/" 2>/dev/null || echo "No templates to copy for sh"
  cp -r templates/* "templates_for_agents/${agent}/ps/" 2>/dev/null || echo "No templates to copy for ps"
  
  # Create archives for each agent and script type
  if [ -d "templates_for_agents/${agent}/sh" ] && [ "$(ls -A templates_for_agents/${agent}/sh)" ]; then
    (cd "templates_for_agents/${agent}/sh" && tar -czf "../../../intent-kit-template-${agent}-sh-v${ASSET_VERSION}.tar.gz" .)
    (cd "templates_for_agents/${agent}/sh" && zip -r "../../../intent-kit-template-${agent}-sh-v${ASSET_VERSION}.zip" .)
  fi
  
  if [ -d "templates_for_agents/${agent}/ps" ] && [ "$(ls -A templates_for_agents/${agent}/ps)" ]; then
    (cd "templates_for_agents/${agent}/ps" && tar -czf "../../../intent-kit-template-${agent}-ps-v${ASSET_VERSION}.tar.gz" .)
    (cd "templates_for_agents/${agent}/ps" && zip -r "../../../intent-kit-template-${agent}-ps-v${ASSET_VERSION}.zip" .)
  fi
done

# Also create a general templates archive
if [ -d "templates" ] && [ "$(ls -A templates)" ]; then
  tar -czf "intent-kit-templates-v${ASSET_VERSION}.tar.gz" templates/
  zip -r "intent-kit-templates-v${ASSET_VERSION}.zip" templates/
fi