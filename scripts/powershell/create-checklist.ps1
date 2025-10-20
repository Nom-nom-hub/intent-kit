# PowerShell script to create quality checklist in the Intent Kit project
# Usage: .\create-checklist.ps1 -Target "document-type"
# Output: JSON with CHECKLIST_FILE and related paths

param(
    [Parameter(Mandatory=$true)]
    [string]$Target
)

# Find the most recent vision directory as the checklist location
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' } | Sort-Object { [int]($_.Name.Split('-')[0]) } -Descending
if ($VisionDirs.Count -gt 0) {
    $ChecklistDir = $VisionDirs[0].FullName
} else {
    Write-Error "No vision directory found for checklist"
    exit 1
}

# Generate the checklist file path
$CHECKLIST_FILE = "$ChecklistDir/checklist.md"

# Find or create a checklists directory in the document's parent
$CHECKLISTS_SUBDIR = "$ChecklistDir/checklists"
if (-not (Test-Path $CHECKLISTS_SUBDIR)) {
    New-Item -ItemType Directory -Path $CHECKLISTS_SUBDIR -Force | Out-Null
}

# Output the result in JSON format
$Result = @{
    CHECKLIST_FILE = $CHECKLIST_FILE
    CHECKLIST_DIR = $ChecklistDir
    CHECKLISTS_SUBDIR = $CHECKLISTS_SUBDIR
} | ConvertTo-Json

Write-Output $Result