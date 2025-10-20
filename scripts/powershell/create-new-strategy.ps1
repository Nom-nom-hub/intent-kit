# PowerShell script to create a new strategy in the Intent Kit project
# Usage: .\create-new-strategy.ps1 -GoalId "goal-name"
# Output: JSON with BRANCH_NAME, STRATEGY_FILE, MILESTONE_FILE, and EXECUTION_FILE

param(
    [Parameter(Mandatory=$true)]
    [string]$GoalId
)

# Find the goal directory based on the goal ID (it's in the vision directory)
$GoalDir = $null
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' }
foreach ($Dir in $VisionDirs) {
    if (Test-Path "$Dir/goal.md" -PathType Leaf) {
        $GoalDir = $Dir.FullName
        break
    }
    elseif ($Dir.Name -like "*$GoalId*") {
        $GoalDir = $Dir.FullName
        break
    }
}

if (-not $GoalDir) {
    Write-Error "Goal directory not found for ID: $GoalId"
    exit 1
}

# Generate the strategy file path
$STRATEGY_FILE = "$GoalDir/strategies.md"

# Generate the milestone file path
$MILESTONE_FILE = "$GoalDir/milestones.md"

# Generate the execution file path
$EXECUTION_FILE = "$GoalDir/execution.md"

# Output the result in JSON format
$Result = @{
    BRANCH_NAME = (Split-Path -Leaf $GoalDir)
    STRATEGY_FILE = $STRATEGY_FILE
    MILESTONE_FILE = $MILESTONE_FILE
    EXECUTION_FILE = $EXECUTION_FILE
    STRATEGY_DIR = $GoalDir
} | ConvertTo-Json

Write-Output $Result