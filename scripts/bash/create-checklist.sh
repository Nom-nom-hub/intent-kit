#!/bin/bash

# Script to create quality checklist in the Intent Kit project
# Usage: ./create-checklist.sh --target "document-type"
# Output: JSON with CHECKLIST_FILE and related paths

set -e  # Exit on any error

TARGET=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --target)
      TARGET="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  echo "Error: --target is required" >&2
  exit 1
fi

# Find the most recent vision directory as the checklist location
CHECKLIST_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    CHECKLIST_DIR="$dir"
    break
  fi
done

if [[ -z "$CHECKLIST_DIR" ]]; then
  echo "Error: No vision directory found for checklist" >&2
  exit 1
fi

# Generate the checklist file path
CHECKLIST_FILE="${CHECKLIST_DIR}/checklist.md"

# Find or create a checklists directory in the document's parent
CHECKLISTS_SUBDIR="${CHECKLIST_DIR}/checklists"
mkdir -p "$CHECKLISTS_SUBDIR"

# Output the result in JSON format
cat <<EOF
{
  "CHECKLIST_FILE": "$CHECKLIST_FILE",
  "CHECKLIST_DIR": "$CHECKLIST_DIR",
  "CHECKLISTS_SUBDIR": "$CHECKLISTS_SUBDIR"
}
EOF