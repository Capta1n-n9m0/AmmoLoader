$ErrorActionPreference = "Stop"

$modName = "ammoloader21"
$modDir = Join-Path $PSScriptRoot "..\ammoloader21"
$version = (Get-Content (Join-Path $modDir "info.json") -Raw | ConvertFrom-Json).version
$distDir = Join-Path $PSScriptRoot "..\dist"
$zipPath = Join-Path $distDir "${modName}_${version}.zip"
$stagingDir = Join-Path $distDir $modName

$exclude = @(
    ".gitignore",
    "config.ld",
    "console.txt",
    "luaFormatterConfig.ini",
    "regex.txt"
)

if (Test-Path $stagingDir) { Remove-Item $stagingDir -Recurse -Force }
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
New-Item -ItemType Directory -Path $distDir -Force | Out-Null

Copy-Item $modDir $stagingDir -Recurse
foreach ($file in $exclude) {
    $path = Join-Path $stagingDir $file
    if (Test-Path $path) { Remove-Item $path -Force }
}

# Compress-Archive uses Windows backslashes — Factorio rejects those zips.
# tar -a creates a zip with forward slashes (works on Windows 10+).
Push-Location $distDir
try {
    & tar.exe -a -cf $zipPath $modName
    if ($LASTEXITCODE -ne 0) {
        throw "tar failed with exit code $LASTEXITCODE"
    }
}
finally {
    Pop-Location
    Remove-Item $stagingDir -Recurse -Force
}

Write-Host "Created $zipPath"
