#!/bin/bash

# Script to create a new strategy in the Intent Kit project
# Usage: ./create-new-strategy.sh --goal-id "goal-name"
# Output: JSON with BRANCH_NAME, STRATEGY_FILE, MILESTONE_FILE, and EXECUTION_FILE

set -e  # Exit on any error

GOAL_ID=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --goal-id)
      GOAL_ID="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$GOAL_ID" ]]; then
  echo "Error: --goal-id is required" >&2
  exit 1
fi

# Find the goal directory based on the goal ID (it's in the vision directory)
GOAL_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    if [[ -f "$dir/goal.md" ]] || [[ $(basename "$dir") == *"$GOAL_ID"* ]]; then
      GOAL_DIR="$dir"
      break
    fi
  fi
done

if [[ -z "$GOAL_DIR" ]]; then
  echo "Error: Goal directory not found for ID: $GOAL_ID" >&2
  exit 1
fi

# Generate the strategy file path
STRATEGY_FILE="${GOAL_DIR}/strategies.md"

# Generate the milestone file path
MILESTONE_FILE="${GOAL_DIR}/milestones.md"

# Generate the execution file path
EXECUTION_FILE="${GOAL_DIR}/execution.md"

# Output the result in JSON format
cat <<EOF
{
  "BRANCH_NAME": "$(basename "$GOAL_DIR")",
  "STRATEGY_FILE": "$STRATEGY_FILE",
  "MILESTONE_FILE": "$MILESTONE_FILE",
  "EXECUTION_FILE": "$EXECUTION_FILE",
  "STRATEGY_DIR": "$GOAL_DIR"
}
EOF