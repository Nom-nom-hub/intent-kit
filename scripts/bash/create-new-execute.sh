#!/bin/bash

# Script to create a new execution plan in the Intent Kit project
# Usage: ./create-new-execute.sh --plan-id "plan-name"
# Output: JSON with BRANCH_NAME, EXECUTE_FILE, TASKS_FILE, and IMPLEMENTATION_FILE

set -e  # Exit on any error

PLAN_ID=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --plan-id)
      PLAN_ID="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$PLAN_ID" ]]; then
  echo "Error: --plan-id is required" >&2
  exit 1
fi

# Find the plan directory based on the plan ID (it's in the vision directory)
PLAN_DIR=""
for dir in visions/[0-9][0-9][0-9]-*; do
  if [[ -d "$dir" ]]; then
    if [[ -f "$dir/plan.md" ]] || [[ $(basename "$dir") == *"$PLAN_ID"* ]]; then
      PLAN_DIR="$dir"
      break
    fi
  fi
done

if [[ -z "$PLAN_DIR" ]]; then
  echo "Error: Plan directory not found for ID: $PLAN_ID" >&2
  exit 1
fi

# Generate the execute file path
EXECUTE_FILE="${PLAN_DIR}/execute.md"

# Generate the tasks file path
TASKS_FILE="${PLAN_DIR}/tasks.md"

# Generate the implementation file path
IMPLEMENTATION_FILE="${PLAN_DIR}/implementation.md"

# Output the result in JSON format
cat <<EOF
{
  "BRANCH_NAME": "$(basename "$PLAN_DIR")",
  "EXECUTE_FILE": "$EXECUTE_FILE",
  "TASKS_FILE": "$TASKS_FILE",
  "IMPLEMENTATION_FILE": "$IMPLEMENTATION_FILE",
  "EXECUTE_DIR": "$PLAN_DIR"
}
EOF