# PowerShell script to create analysis report in the Intent Kit project
# Usage: .\create-analysis-report.ps1 -Docs "doc1,doc2,doc3"
# Output: JSON with ANALYSIS_FILE and related paths

param(
    [Parameter(Mandatory=$true)]
    [string]$Docs
)

# Find the most recent vision directory as the analysis location
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' } | Sort-Object { [int]($_.Name.Split('-')[0]) } -Descending
if ($VisionDirs.Count -gt 0) {
    $AnalysisDir = $VisionDirs[0].FullName
} else {
    Write-Error "No vision directory found for analysis"
    exit 1
}

# Generate the analysis file path
$ANALYSIS_FILE = "$AnalysisDir/analysis.md"

# Find or create a checklists directory in the document's parent
$CHECKLISTS_DIR = "$AnalysisDir/checklists"
if (-not (Test-Path $CHECKLISTS_DIR)) {
    New-Item -ItemType Directory -Path $CHECKLISTS_DIR -Force | Out-Null
}

# Output the result in JSON format
$Result = @{
    ANALYSIS_FILE = $ANALYSIS_FILE
    ANALYSIS_DIR = $AnalysisDir
    CHECKLISTS_DIR = $CHECKLISTS_DIR
} | ConvertTo-Json

Write-Output $Result