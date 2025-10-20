#!/bin/bash

# Script to create a new goal in the Intent Kit project
# Usage: ./create-new-goal.sh --vision-id "vision-name"
# Output: JSON with BRANCH_NAME, GOAL_FILE, RESEARCH_FILE, and VALIDATION_FILE

set -e  # Exit on any error

VISION_ID=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --vision-id)
      VISION_ID="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$VISION_ID" ]]; then
  echo "Error: --vision-id is required" >&2
  exit 1
fi

# Find the vision directory based on the vision ID
VISION_DIR=""
for dir in visions/[0-9][0-9][0-9]-$VISION_ID*; do
  if [[ -d "$dir" ]]; then
    VISION_DIR="$dir"
    break
  fi
done

if [[ -z "$VISION_DIR" ]]; then
  echo "Error: Vision directory not found for ID: $VISION_ID" >&2
  exit 1
fi

# Generate the goal file path
GOAL_FILE="${VISION_DIR}/goal.md"

# Generate the research file path
RESEARCH_FILE="${VISION_DIR}/research.md"

# Generate the validation file path
VALIDATION_FILE="${VISION_DIR}/validation.md"

# Output the result in JSON format
cat <<EOF
{
  "BRANCH_NAME": "$(basename "$VISION_DIR")",
  "GOAL_FILE": "$GOAL_FILE",
  "RESEARCH_FILE": "$RESEARCH_FILE",
  "VALIDATION_FILE": "$VALIDATION_FILE",
  "GOAL_DIR": "$VISION_DIR"
}
EOF