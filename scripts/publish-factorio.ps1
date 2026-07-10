param(
    [string]$ApiKey = $env:FACTORIO_TOKEN
)

$ErrorActionPreference = "Stop"
$modName = "ammoloader21"
$zipPath = Join-Path $PSScriptRoot "..\dist\${modName}_2.1.0.zip"

if (-not $ApiKey) {
    Write-Error "Set FACTORIO_TOKEN environment variable with a Factorio API key (Publish Mods permission)."
}

if (-not (Test-Path $zipPath)) {
    & (Join-Path $PSScriptRoot "package.ps1")
}

$headers = @{ Authorization = "Bearer $ApiKey" }
$initUrl = "https://mods.factorio.com/api/v2/mods/init_publish"
$response = Invoke-RestMethod -Uri $initUrl -Method Post -Headers $headers -Body @{ mod = $modName }
$uploadUrl = $response.upload_url

$form = @{
    file = Get-Item $zipPath
    description = "# AmmoLoader 2.1`n`nFork of Ammo Loader+ updated for Factorio 2.1."
    license = "LGPL-3.0"
    source_url = "https://github.com/ukaszstm/ammoloader21"
    category = "content"
}

$result = Invoke-RestMethod -Uri $uploadUrl -Method Post -Form $form
Write-Host "Published successfully: $($result | ConvertTo-Json -Compress)"
