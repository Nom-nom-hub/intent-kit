#!/bin/bash

# Script to create clarification analysis in the Intent Kit project
# Usage: ./create-clarify-questions.sh --doc-ref "document-reference"
# Output: JSON with CLARIFY_FILE and related paths

set -e  # Exit on any error

DOC_REF=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --doc-ref)
      DOC_REF="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$DOC_REF" ]]; then
  echo "Error: --doc-ref is required" >&2
  exit 1
fi

# Find the document directory based on the reference
DOC_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    for file in "$dir"/*.md; do
      if [[ -f "$file" ]] && [[ "$file" == *"$DOC_REF"* ]]; then
        DOC_DIR="$dir"
        break 2
      fi
    done
    if [[ $(basename "$dir") == *"$DOC_REF"* ]]; then
      DOC_DIR="$dir"
      break
    fi
  fi
done

if [[ -z "$DOC_DIR" ]]; then
  # If no specific document found, use the most recent vision directory
  for dir in visions/[0-9][0-9][0-9]-*; do
    if [[ -d "$dir" ]]; then
      DOC_DIR="$dir"
      break
    fi
  done
fi

if [[ -z "$DOC_DIR" ]]; then
  echo "Error: No vision directory found for reference: $DOC_REF" >&2
  exit 1
fi

# Generate the clarify file path
CLARIFY_FILE="${DOC_DIR}/clarify.md"

# Find or create a checklists directory in the document's parent
CHECKLISTS_DIR="${DOC_DIR}/checklists"
mkdir -p "$CHECKLISTS_DIR"

# Output the result in JSON format
cat <<EOF
{
  "CLARIFY_FILE": "$CLARIFY_FILE",
  "CLARIFY_DIR": "$DOC_DIR",
  "CHECKLISTS_DIR": "$CHECKLISTS_DIR"
}
EOF