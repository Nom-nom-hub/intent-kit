# PowerShell script to update agent-specific context files based on current project context
# Updates the rules/command files for the specified agent or all agents if none specified

param(
    [string]$AgentType = "",
    [switch]$ForceUpdate = $false
)

# Get the repository root directory
$RepoRoot = Resolve-Path "$PSScriptRoot\..\.."

# Function to update a specific agent file
function Update-AgentFile {
    param(
        [string]$FilePath,
        [string]$AgentName
    )

    # Check if file exists and force update flag
    if ((-not (Test-Path $FilePath)) -and (-not $ForceUpdate)) {
        Write-Host "File does not exist: $FilePath (skipping)" -ForegroundColor Yellow
        return
    }

    Write-Host "Updating $AgentName file: $FilePath" -ForegroundColor Green

    # Create directory if it doesn't exist
    $DirPath = Split-Path $FilePath -Parent
    if (-not (Test-Path $DirPath)) {
        New-Item -ItemType Directory -Path $DirPath -Force | Out-Null
    }

    # Create or update the agent-specific file with the appropriate content
    $AgentRulesContent = @'
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
'@

    $AgentRulesContent | Out-File -FilePath $FilePath -Encoding UTF8
    Write-Host "✓ Updated $FilePath" -ForegroundColor Green
}

# Determine which agent files need to be updated
switch ($AgentType) {
    "claude" {
        $ClaudeFile = Join-Path $RepoRoot ".claude\commands\intent-rules.md"
        Update-AgentFile $ClaudeFile "Claude"
    }
    "gemini" {
        $GeminiFile = Join-Path $RepoRoot ".gemini\commands\intent-rules.md"
        Update-AgentFile $GeminiFile "Gemini"
    }
    "copilot" {
        $CopilotFile = Join-Path $RepoRoot ".github\prompts\intent-rules.md"
        Update-AgentFile $CopilotFile "GitHub Copilot"
    }
    "cursor-agent" {
        $CursorFile = Join-Path $RepoRoot ".cursor\commands\intent-rules.md"
        Update-AgentFile $CursorFile "Cursor"
    }
    "qwen" {
        $QwenFile = Join-Path $RepoRoot ".qwen\commands\intent-rules.md"
        Update-AgentFile $QwenFile "Qwen"
    }
    "opencode" {
        $OpenCodeFile = Join-Path $RepoRoot ".opencode\command\intent-rules.md"
        Update-AgentFile $OpenCodeFile "opencode"
    }
    "codex" {
        $CodexFile = Join-Path $RepoRoot ".codex\commands\intent-rules.md"
        Update-AgentFile $CodexFile "Codex"
    }
    "windsurf" {
        $WindsurfFile = Join-Path $RepoRoot ".windsurf\workflows\intent-rules.md"
        Update-AgentFile $WindsurfFile "Windsurf"
    }
    "kilocode" {
        $KiloCodeFile = Join-Path $RepoRoot ".kilocode\rules\intent-rules.md"
        Update-AgentFile $KiloCodeFile "Kilo Code"
    }
    "auggie" {
        $AuggieFile = Join-Path $RepoRoot ".augment\rules\intent-rules.md"
        Update-AgentFile $AuggieFile "Auggie"
    }
    "roo" {
        $RooFile = Join-Path $RepoRoot ".roo\rules\intent-rules.md"
        Update-AgentFile $RooFile "Roo Code"
    }
    "codebuddy" {
        $CodeBuddyFile = Join-Path $RepoRoot ".codebuddy\commands\intent-rules.md"
        Update-AgentFile $CodeBuddyFile "CodeBuddy"
    }
    "q" {
        $AmazonQFile = Join-Path $RepoRoot ".amazonq\prompts\intent-rules.md"
        Update-AgentFile $AmazonQFile "Amazon Q Developer"
    }
    "" {
        # No specific agent specified - update all agent files that exist
        Write-Host "Updating context for all agents..." -ForegroundColor Cyan

        $AgentFiles = @(
            @{file = (Join-Path $RepoRoot ".claude\commands\intent-rules.md"); name = "Claude"},
            @{file = (Join-Path $RepoRoot ".gemini\commands\intent-rules.md"); name = "Gemini"},
            @{file = (Join-Path $RepoRoot ".github\prompts\intent-rules.md"); name = "GitHub Copilot"},
            @{file = (Join-Path $RepoRoot ".cursor\commands\intent-rules.md"); name = "Cursor"},
            @{file = (Join-Path $RepoRoot ".qwen\commands\intent-rules.md"); name = "Qwen"},
            @{file = (Join-Path $RepoRoot ".opencode\command\intent-rules.md"); name = "opencode"},
            @{file = (Join-Path $RepoRoot ".codex\commands\intent-rules.md"); name = "Codex"},
            @{file = (Join-Path $RepoRoot ".windsurf\workflows\intent-rules.md"); name = "Windsurf"},
            @{file = (Join-Path $RepoRoot ".kilocode\rules\intent-rules.md"); name = "Kilo Code"},
            @{file = (Join-Path $RepoRoot ".augment\rules\intent-rules.md"); name = "Auggie"},
            @{file = (Join-Path $RepoRoot ".roo\rules\intent-rules.md"); name = "Roo Code"},
            @{file = (Join-Path $RepoRoot ".codebuddy\commands\intent-rules.md"); name = "CodeBuddy"},
            @{file = (Join-Path $RepoRoot ".amazonq\prompts\intent-rules.md"); name = "Amazon Q Developer"}
        )

        foreach ($pair in $AgentFiles) {
            if ((Test-Path $pair.file) -or $ForceUpdate) {
                $parentDir = Split-Path (Split-Path $pair.file -Parent) -Leaf
                Update-AgentFile $pair.file $pair.name
            }
        }
    }
    default {
        Write-Host "Unknown agent type: $AgentType" -ForegroundColor Red
        Write-Host "Supported types: claude, gemini, copilot, cursor-agent, qwen, opencode, codex, windsurf, kilocode, auggie, roo, codebuddy, q" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✓ Agent context updates completed!" -ForegroundColor Green