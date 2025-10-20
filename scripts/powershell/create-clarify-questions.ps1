# PowerShell script to create clarification analysis in the Intent Kit project
# Usage: .\create-clarify-questions.ps1 -DocRef "document-reference"
# Output: JSON with CLARIFY_FILE and related paths

param(
    [Parameter(Mandatory=$true)]
    [string]$DocRef
)

# Find the document directory based on the reference
$DocDir = $null
$VisionDirs = Get-ChildItem -Path "visions" -Directory | Where-Object { $_.Name -match '^\d{3}-' } | Sort-Object { [int]($_.Name.Split('-')[0]) } -Descending
foreach ($Dir in $VisionDirs) {
    $Files = Get-ChildItem -Path $Dir.FullName -Filter "*.md"
    foreach ($File in $Files) {
        if ($File.Name -like "*$DocRef*") {
            $DocDir = $Dir.FullName
            break
        }
    }
    if (-not $DocDir -and $Dir.Name -like "*$DocRef*") {
        $DocDir = $Dir.FullName
        break
    }
    if ($DocDir) { break }
}

if (-not $DocDir) {
    # If no specific document found, use the most recent vision directory
    if ($VisionDirs.Count -gt 0) {
        $DocDir = $VisionDirs[0].FullName
    }
}

if (-not $DocDir) {
    Write-Error "No vision directory found for reference: $DocRef"
    exit 1
}

# Generate the clarify file path
$CLARIFY_FILE = "$DocDir/clarify.md"

# Find or create a checklists directory in the document's parent
$CHECKLISTS_DIR = "$DocDir/checklists"
if (-not (Test-Path $CHECKLISTS_DIR)) {
    New-Item -ItemType Directory -Path $CHECKLISTS_DIR -Force | Out-Null
}

# Output the result in JSON format
$Result = @{
    CLARIFY_FILE = $CLARIFY_FILE
    CLARIFY_DIR = $DocDir
    CHECKLISTS_DIR = $CHECKLISTS_DIR
} | ConvertTo-Json

Write-Output $Result