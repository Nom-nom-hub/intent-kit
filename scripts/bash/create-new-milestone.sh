#!/bin/bash

# Script to create a new milestone plan in the Intent Kit project
# Usage: ./create-new-milestone.sh --strategy-id "strategy-name"
# Output: JSON with BRANCH_NAME, PLAN_FILE, EXECUTE_FILE, and MILESTONE_FILE

set -e  # Exit on any error

STRATEGY_ID=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --strategy-id)
      STRATEGY_ID="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$STRATEGY_ID" ]]; then
  echo "Error: --strategy-id is required" >&2
  exit 1
fi

# Find the strategy directory based on the strategy ID (it's in the vision directory)
STRATEGY_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    if [[ -f "$dir/strategies.md" ]] || [[ $(basename "$dir") == *"$STRATEGY_ID"* ]]; then
      STRATEGY_DIR="$dir"
      break
    fi
  fi
done

if [[ -z "$STRATEGY_DIR" ]]; then
  echo "Error: Strategy directory not found for ID: $STRATEGY_ID" >&2
  exit 1
fi

# Generate the plan file path (milestone plan)
PLAN_FILE="${STRATEGY_DIR}/plan.md"

# Generate the execute file path
EXECUTE_FILE="${STRATEGY_DIR}/execute.md"

# Generate the milestone file path
MILESTONE_FILE="${STRATEGY_DIR}/milestones.md"

# Output the result in JSON format
cat <<EOF
{
  "BRANCH_NAME": "$(basename "$STRATEGY_DIR")",
  "PLAN_FILE": "$PLAN_FILE",
  "EXECUTE_FILE": "$EXECUTE_FILE",
  "MILESTONE_FILE": "$MILESTONE_FILE",
  "PLAN_DIR": "$STRATEGY_DIR"
}
EOF