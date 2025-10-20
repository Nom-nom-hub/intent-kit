# PowerShell script to create a new vision in the Intent Kit project
# Usage: .\create-new-vision.ps1 -ShortName "vision-name"
# Output: JSON with BRANCH_NAME and VISION_FILE

param(
    [Parameter(Mandatory=$true)]
    [string]$ShortName
)

# Find the next vision number by looking at existing vision directories
$VISIONS_DIR = "visions"
$NEXT_NUMBER = 1

if (Test-Path $VISIONS_DIR) {
    # Find the highest existing number and increment
    $Dirs = Get-ChildItem -Path $VISIONS_DIR -Directory | Where-Object { $_.Name -match '^\d{3}-' }
    foreach ($Dir in $Dirs) {
        $Num = [int]($Dir.Name.Split('-')[0])
        if ($Num -ge $NEXT_NUMBER) {
            $NEXT_NUMBER = $Num + 1
        }
    }
}

# Format the vision directory name with leading zeros
$FORMATTED_NUMBER = "{0:D3}" -f $NEXT_NUMBER
$VISION_DIR = "$VISIONS_DIR/$FORMATTED_NUMBER-$ShortName"

# Create the vision directory
New-Item -ItemType Directory -Path $VISION_DIR -Force | Out-Null

# Generate the branch name
$BRANCH_NAME = "$FORMATTED_NUMBER-$ShortName"

# Create the vision file path
$VISION_FILE = "$VISION_DIR/vision.md"

# Output the result in JSON format
$Result = @{
    BRANCH_NAME = $BRANCH_NAME
    VISION_FILE = $VISION_FILE
    VISION_DIR = $VISION_DIR
} | ConvertTo-Json

Write-Output $Result