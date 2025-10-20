#!/bin/bash

# Script to create analysis report in the Intent Kit project
# Usage: ./create-analysis-report.sh --docs "doc1,doc2,doc3"
# Output: JSON with ANALYSIS_FILE and related paths

set -e  # Exit on any error

DOCS=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --docs)
      DOCS="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$DOCS" ]]; then
  echo "Error: --docs is required" >&2
  exit 1
fi

# Find the most recent vision directory as the analysis location
ANALYSIS_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    ANALYSIS_DIR="$dir"
    break
  fi
done

if [[ -z "$ANALYSIS_DIR" ]]; then
  echo "Error: No vision directory found for analysis" >&2
  exit 1
fi

# Generate the analysis file path
ANALYSIS_FILE="${ANALYSIS_DIR}/analysis.md"

# Find or create a checklists directory in the document's parent
CHECKLISTS_DIR="${ANALYSIS_DIR}/checklists"
mkdir -p "$CHECKLISTS_DIR"

# Output the result in JSON format
cat <<EOF
{
  "ANALYSIS_FILE": "$ANALYSIS_FILE",
  "ANALYSIS_DIR": "$ANALYSIS_DIR",
  "CHECKLISTS_DIR": "$CHECKLISTS_DIR"
}
EOF