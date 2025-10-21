#!/usr/bin/env bash
set -euo pipefail

# create-github-release.sh
# Create a GitHub release with all template zip files
# Usage: create-github-release.sh <version>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

VERSION="$1"

# Remove 'v' prefix from version for release title
VERSION_NO_V=${VERSION#v}

# Upload all generated assets using GitHub CLI
gh release create "$VERSION" \
  .genreleases/intent-kit-template-copilot-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-copilot-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-claude-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-claude-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-gemini-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-gemini-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-cursor-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-cursor-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-qwen-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-qwen-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-opencode-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-opencode-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-codex-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-codex-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-windsurf-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-windsurf-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-kilocode-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-kilocode-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-auggie-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-auggie-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-roo-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-roo-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-codebuddy-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-codebuddy-ps-"$VERSION".zip \
  .genreleases/intent-kit-template-q-sh-"$VERSION".zip \
  .genreleases/intent-kit-template-q-ps-"$VERSION".zip \
  --title "Intent Kit Templates - $VERSION_NO_V" \
  --notes-file release_notes.txt

# Also upload the main Python packages if they exist
if [ -f "intent-kit-${VERSION_NO_V}.zip" ]; then
  gh release upload "$VERSION" "intent-kit-${VERSION_NO_V}.zip" --clobber
fi