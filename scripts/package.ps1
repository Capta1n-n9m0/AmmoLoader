$ErrorActionPreference = "Stop"

$modName = "ammoloader21"
$version = (Get-Content "$PSScriptRoot\..\ammoloader21\info.json" -Raw | ConvertFrom-Json).version
$distDir = Join-Path $PSScriptRoot "..\dist"
$zipPath = Join-Path $distDir "${modName}_${version}.zip"
$stagingDir = Join-Path $distDir $modName

if (Test-Path $stagingDir) { Remove-Item $stagingDir -Recurse -Force }
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
New-Item -ItemType Directory -Path $distDir -Force | Out-Null

Copy-Item (Join-Path $PSScriptRoot "..\ammoloader21") $stagingDir -Recurse
Compress-Archive -Path $stagingDir -DestinationPath $zipPath -Force
Remove-Item $stagingDir -Recurse -Force

Write-Host "Created $zipPath"
