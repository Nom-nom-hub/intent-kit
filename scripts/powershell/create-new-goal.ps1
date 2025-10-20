# PowerShell script to create a new goal in the Intent Kit project
# Usage: .\create-new-goal.ps1 -VisionId "vision-name"
# Output: JSON with BRANCH_NAME, GOAL_FILE, RESEARCH_FILE, and VALIDATION_FILE

param(
    [Parameter(Mandatory=$true)]
    [string]$VisionId
)

# Find the vision directory based on the vision ID
$VisionDir = $null
$Dirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' -and $_.Name -like "*$VisionId*" }
if ($Dirs.Count -gt 0) {
    $VisionDir = $Dirs[0].FullName
}

if (-not $VisionDir) {
    Write-Error "Vision directory not found for ID: $VisionId"
    exit 1
}

# Generate the goal file path
$GOAL_FILE = "$VisionDir/goal.md"

# Generate the research file path
$RESEARCH_FILE = "$VisionDir/research.md"

# Generate the validation file path
$VALIDATION_FILE = "$VisionDir/validation.md"

# Output the result in JSON format
$Result = @{
    BRANCH_NAME = (Split-Path -Leaf $VisionDir)
    GOAL_FILE = $GOAL_FILE
    RESEARCH_FILE = $RESEARCH_FILE
    VALIDATION_FILE = $VALIDATION_FILE
    GOAL_DIR = $VisionDir
} | ConvertTo-Json

Write-Output $Result