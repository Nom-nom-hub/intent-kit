# PowerShell script to create a new execution plan in the Intent Kit project
# Usage: .\create-new-execute.ps1 -PlanId "plan-name"
# Output: JSON with BRANCH_NAME, EXECUTE_FILE, TASKS_FILE, and IMPLEMENTATION_FILE

param(
    [Parameter(Mandatory=$true)]
    [string]$PlanId
)

# Find the plan directory based on the plan ID (it's in the vision directory)
$PlanDir = $null
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' }
foreach ($Dir in $VisionDirs) {
    if (Test-Path "$Dir/plan.md" -PathType Leaf) {
        $PlanDir = $Dir.FullName
        break
    }
    elseif ($Dir.Name -like "*$PlanId*") {
        $PlanDir = $Dir.FullName
        break
    }
}

if (-not $PlanDir) {
    Write-Error "Plan directory not found for ID: $PlanId"
    exit 1
}

# Generate the execute file path
$EXECUTE_FILE = "$PlanDir/execute.md"

# Generate the tasks file path
$TASKS_FILE = "$PlanDir/tasks.md"

# Generate the implementation file path
$IMPLEMENTATION_FILE = "$PlanDir/implementation.md"

# Output the result in JSON format
$Result = @{
    BRANCH_NAME = (Split-Path -Leaf $PlanDir)
    EXECUTE_FILE = $EXECUTE_FILE
    TASKS_FILE = $TASKS_FILE
    IMPLEMENTATION_FILE = $IMPLEMENTATION_FILE
    EXECUTE_DIR = $PlanDir
} | ConvertTo-Json

Write-Output $Result