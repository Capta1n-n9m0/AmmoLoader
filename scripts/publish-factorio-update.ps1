param(
    [string]$ApiKey = $env:FACTORIO_TOKEN
)

$ErrorActionPreference = "Stop"
$modName = "ammoloader21"
$modDir = Join-Path $PSScriptRoot "..\ammoloader21"
$version = (Get-Content (Join-Path $modDir "info.json") -Raw | ConvertFrom-Json).version
$zipPath = Join-Path $PSScriptRoot "..\dist\${modName}_${version}.zip"

if (-not $ApiKey) {
    Write-Error "Set FACTORIO_TOKEN environment variable with a Factorio API key (Upload Mods permission)."
}

& (Join-Path $PSScriptRoot "package.ps1")
$zipPath = (Resolve-Path $zipPath).Path

function Convert-ToCurlPath([string]$Path) {
    return ($Path -replace '\\', '/')
}

$headers = @{ Authorization = "Bearer $ApiKey" }
$initUrl = "https://mods.factorio.com/api/v2/mods/releases/init_upload"

try {
    $response = Invoke-RestMethod -Uri $initUrl -Method Post -Headers $headers -Body @{ mod = $modName }
} catch {
    Write-Error "init_upload failed: $($_.Exception.Message)"
}

if ($response.error) {
    Write-Error "init_upload error: $($response.error) - $($response.message)"
}

$uploadUrl = $response.upload_url
$zipCurlPath = Convert-ToCurlPath $zipPath

Write-Host "Uploading release $version ..."
$output = (& curl.exe -s -S -X POST $uploadUrl -F "file=@$zipCurlPath" 2>&1 | Out-String).Trim()

if ($LASTEXITCODE -ne 0) {
    Write-Host "Server response:"
    Write-Host $output
    throw "Upload failed with exit code $LASTEXITCODE"
}

try {
    $result = $output | ConvertFrom-Json
    if ($result.error) {
        Write-Host "Server response:"
        Write-Host $output
        throw "Upload rejected: $($result.error) - $($result.message)"
    }
} catch {
    if ($_.Exception.Message -like "Upload rejected:*") { throw }
}

Write-Host "Release $version published successfully:"
Write-Host $output
