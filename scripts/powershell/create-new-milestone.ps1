# PowerShell script to create a new milestone plan in the Intent Kit project
# Usage: .\create-new-milestone.ps1 -StrategyId "strategy-name"
# Output: JSON with BRANCH_NAME, PLAN_FILE, EXECUTE_FILE, and MILESTONE_FILE

param(
    [Parameter(Mandatory=$true)]
    [string]$StrategyId
)

# Find the strategy directory based on the strategy ID (it's in the vision directory)
$StrategyDir = $null
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' }
foreach ($Dir in $VisionDirs) {
    if (Test-Path "$Dir/strategies.md" -PathType Leaf) {
        $StrategyDir = $Dir.FullName
        break
    }
    elseif ($Dir.Name -like "*$StrategyId*") {
        $StrategyDir = $Dir.FullName
        break
    }
}

if (-not $StrategyDir) {
    Write-Error "Strategy directory not found for ID: $StrategyId"
    exit 1
}

# Generate the plan file path (milestone plan)
$PLAN_FILE = "$StrategyDir/plan.md"

# Generate the execute file path
$EXECUTE_FILE = "$StrategyDir/execute.md"

# Generate the milestone file path
$MILESTONE_FILE = "$StrategyDir/milestones.md"

# Output the result in JSON format
$Result = @{
    BRANCH_NAME = (Split-Path -Leaf $StrategyDir)
    PLAN_FILE = $PLAN_FILE
    EXECUTE_FILE = $EXECUTE_FILE
    MILESTONE_FILE = $MILESTONE_FILE
    PLAN_DIR = $StrategyDir
} | ConvertTo-Json

Write-Output $Result