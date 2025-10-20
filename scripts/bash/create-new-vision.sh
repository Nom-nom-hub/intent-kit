#!/bin/bash

# Script to create a new vision in the Intent Kit project
# Usage: ./create-new-vision.sh --short-name "vision-name"
# Output: JSON with BRANCH_NAME and VISION_FILE

set -e  # Exit on any error

SHORT_NAME=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --short-name)
      SHORT_NAME="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$SHORT_NAME" ]]; then
  echo "Error: --short-name is required" >&2
  exit 1
fi

# Find the next vision number by looking at existing vision directories
VISIONS_DIR="visions"
NEXT_NUMBER=1

if [[ -d "$VISIONS_DIR" ]]; then
  # Find the highest existing number and increment
  for dir in "$VISIONS_DIR"/[0-9][0-9][0-9]-*; do
    if [[ -d "$dir" ]]; then
      num=$(basename "$dir" | cut -d'-' -f1)
      if [[ "$num" =~ ^[0-9]+$ ]] && (( num >= NEXT_NUMBER )); then
        NEXT_NUMBER=$((num + 1))
      fi
    fi
  done
fi

# Format the vision directory name with leading zeros
FORMATTED_NUMBER=$(printf "%03d" $NEXT_NUMBER)
VISION_DIR="${VISIONS_DIR}/${FORMATTED_NUMBER}-${SHORT_NAME}"

# Create the vision directory
mkdir -p "$VISION_DIR"

# Generate the branch name
BRANCH_NAME="${FORMATTED_NUMBER}-${SHORT_NAME}"

# Create the vision file path
VISION_FILE="${VISION_DIR}/vision.md"

# Output the result in JSON format
cat <<EOF
{
  "BRANCH_NAME": "$BRANCH_NAME",
  "VISION_FILE": "$VISION_FILE",
  "VISION_DIR": "$VISION_DIR"
}
EOF