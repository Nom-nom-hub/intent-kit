#!/bin/bash

# Script to update agent-specific context files based on current project context
# Updates the rules/command files for the specified agent or all agents if none specified

set -e  # Exit on any error

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AGENT_TYPE=""
FORCE_UPDATE=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --agent)
      AGENT_TYPE="$2"
      shift 2
      ;;
    --force)
      FORCE_UPDATE=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [--agent <agent-type>] [--force]"
      echo "Agent types: claude, gemini, copilot, cursor-agent, qwen, opencode, codex, windsurf, kilocode, auggie, roo, codebuddy, q"
      exit 1
      ;;
  esac
done

# Function to update a specific agent file
update_agent_file() {
  local file_path="$1"
  local agent_name="$2"
  
  if [[ ! -f "$file_path" ]] && [[ "$FORCE_UPDATE" == false ]]; then
    echo "File does not exist: $file_path (skipping)"
    return
  fi
  
  echo "Updating $agent_name file: $file_path"
  
  # Get the script path to insert into the agent file
  SCRIPT_PATH="${REPO_ROOT}/scripts"
  
  # Create directory if it doesn't exist
  mkdir -p "$(dirname "$file_path")"
  
  # Create or update the agent-specific file with the appropriate content
  cat > "$file_path" << 'EOL'
# Intent Kit Agent Rules

This file contains the agent-specific rules and commands for Intent-Driven Development.

## Core Commands

- `/intentk.vision` - Create or update project vision and guiding principles
- `/intentk.goal` - Define measurable goals with specific success metrics
- `/intentk.strategies` - Explore multiple implementation strategies and approaches
- `/intentk.milestones` - Create measurable progress checkpoints with success criteria
- `/intentk.execute` - Execute with learning loops and adaptation mechanisms

## Optional Commands

- `/intentk.clarify` - Clarify underspecified areas (recommended before `/intentk.goal`)
- `/intentk.analyze` - Intent alignment & risk assessment (run after `/intentk.goal`, before `/intentk.strategies`)
- `/intentk.checklist` - Generate custom quality checklists that validate intent clarity and strategy feasibility

## Working with Intent Kit

1. Start with `/intentk.vision` to establish your project's foundational vision
2. Use `/intentk.goal` to define your measurable goals with specific success metrics
3. Explore strategies with `/intentk.strategies` to find the best implementation approach
4. Create milestones with `/intentk.milestones` to track measurable progress
5. Execute with `/intentk.execute` using learning loops and adaptations

Remember to use the optional commands (`clarify`, `analyze`, `checklist`) when needed to improve outcome achievement.

## Intent-Driven Development Principles

- Focus on outcomes over implementation details
- Validate assumptions through learning loops
- Prioritize user intents in all decisions
- Measure success against original goals
EOL

  echo "✓ Updated $file_path"
}

# Determine which agent files need to be updated
case "$AGENT_TYPE" in
  claude)
    CLAUDE_FILE="$REPO_ROOT/.claude/commands/intent-rules.md"
    update_agent_file "$CLAUDE_FILE" "Claude"
    ;;
  gemini)
    GEMINI_FILE="$REPO_ROOT/.gemini/commands/intent-rules.md"
    update_agent_file "$GEMINI_FILE" "Gemini"
    ;;
  copilot)
    COPILOT_FILE="$REPO_ROOT/.github/prompts/intent-rules.md"
    update_agent_file "$COPILOT_FILE" "GitHub Copilot"
    ;;
  cursor-agent)
    CURSOR_FILE="$REPO_ROOT/.cursor/commands/intent-rules.md"
    update_agent_file "$CURSOR_FILE" "Cursor"
    ;;
  qwen)
    QWEN_FILE="$REPO_ROOT/.qwen/commands/intent-rules.md"
    update_agent_file "$QWEN_FILE" "Qwen"
    ;;
  opencode)
    OPENCODE_FILE="$REPO_ROOT/.opencode/command/intent-rules.md"
    update_agent_file "$OPENCODE_FILE" "opencode"
    ;;
  codex)
    CODEX_FILE="$REPO_ROOT/.codex/commands/intent-rules.md"
    update_agent_file "$CODEX_FILE" "Codex"
    ;;
  windsurf)
    WINDSURF_FILE="$REPO_ROOT/.windsurf/workflows/intent-rules.md"
    update_agent_file "$WINDSURF_FILE" "Windsurf"
    ;;
  kilocode)
    KILOCODE_FILE="$REPO_ROOT/.kilocode/rules/intent-rules.md"
    update_agent_file "$KILOCODE_FILE" "Kilo Code"
    ;;
  auggie)
    AUGGIE_FILE="$REPO_ROOT/.augment/rules/intent-rules.md"
    update_agent_file "$AUGGIE_FILE" "Auggie"
    ;;
  roo)
    ROO_FILE="$REPO_ROOT/.roo/rules/intent-rules.md"
    update_agent_file "$ROO_FILE" "Roo Code"
    ;;
  codebuddy)
    CODEBUDDY_FILE="$REPO_ROOT/.codebuddy/commands/intent-rules.md"
    update_agent_file "$CODEBUDDY_FILE" "CodeBuddy"
    ;;
  q)
    AMAZONQ_FILE="$REPO_ROOT/.amazonq/prompts/intent-rules.md"
    update_agent_file "$AMAZONQ_FILE" "Amazon Q Developer"
    ;;
  "")
    # No specific agent specified - update all agent files that exist
    echo "Updating context for all agents..."
    
    for agent_file in "$REPO_ROOT/.claude/commands/intent-rules.md" \
                      "$REPO_ROOT/.gemini/commands/intent-rules.md" \
                      "$REPO_ROOT/.github/prompts/intent-rules.md" \
                      "$REPO_ROOT/.cursor/commands/intent-rules.md" \
                      "$REPO_ROOT/.qwen/commands/intent-rules.md" \
                      "$REPO_ROOT/.opencode/command/intent-rules.md" \
                      "$REPO_ROOT/.codex/commands/intent-rules.md" \
                      "$REPO_ROOT/.windsurf/workflows/intent-rules.md" \
                      "$REPO_ROOT/.kilocode/rules/intent-rules.md" \
                      "$REPO_ROOT/.augment/rules/intent-rules.md" \
                      "$REPO_ROOT/.roo/rules/intent-rules.md" \
                      "$REPO_ROOT/.codebuddy/commands/intent-rules.md" \
                      "$REPO_ROOT/.amazonq/prompts/intent-rules.md"; do
      if [[ -f "$agent_file" ]] || [[ "$FORCE_UPDATE" == true ]]; then
        agent_dir=$(basename "$(dirname "$agent_file")")
        case "$agent_dir" in
          .claude) update_agent_file "$agent_file" "Claude" ;;
          .gemini) update_agent_file "$agent_file" "Gemini" ;;
          .github) update_agent_file "$agent_file" "GitHub Copilot" ;;
          .cursor) update_agent_file "$agent_file" "Cursor" ;;
          .qwen) update_agent_file "$agent_file" "Qwen" ;;
          .opencode) update_agent_file "$agent_file" "opencode" ;;
          .codex) update_agent_file "$agent_file" "Codex" ;;
          .windsurf) update_agent_file "$agent_file" "Windsurf" ;;
          .kilocode) update_agent_file "$agent_file" "Kilo Code" ;;
          .augment) update_agent_file "$agent_file" "Auggie" ;;
          .roo) update_agent_file "$agent_file" "Roo Code" ;;
          .codebuddy) update_agent_file "$agent_file" "CodeBuddy" ;;
          .amazonq) update_agent_file "$agent_file" "Amazon Q Developer" ;;
        esac
      fi
    done
    ;;
  *)
    echo "Unknown agent type: $AGENT_TYPE"
    echo "Supported types: claude, gemini, copilot, cursor-agent, qwen, opencode, codex, windsurf, kilocode, auggie, roo, codebuddy, q"
    exit 1
    ;;
esac

echo "✓ Agent context updates completed!"