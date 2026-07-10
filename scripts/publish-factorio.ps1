param(
    [string]$ApiKey = $env:FACTORIO_TOKEN
)

$ErrorActionPreference = "Stop"
$modName = "ammoloader21"
$modDir = Join-Path $PSScriptRoot "..\ammoloader21"
$version = (Get-Content (Join-Path $modDir "info.json") -Raw | ConvertFrom-Json).version
$zipPath = (Resolve-Path (Join-Path $PSScriptRoot "..\dist\${modName}_${version}.zip")).Path

if (-not $ApiKey) {
    Write-Error "Set FACTORIO_TOKEN environment variable with a Factorio API key (Publish Mods permission)."
}

if (-not (Test-Path $zipPath)) {
    & (Join-Path $PSScriptRoot "package.ps1")
    $zipPath = (Resolve-Path (Join-Path $PSScriptRoot "..\dist\${modName}_${version}.zip")).Path
}

function Convert-ToCurlPath([string]$Path) {
    return ($Path -replace '\\', '/')
}

$headers = @{ Authorization = "Bearer $ApiKey" }
$initUrl = "https://mods.factorio.com/api/v2/mods/init_publish"

try {
    $response = Invoke-RestMethod -Uri $initUrl -Method Post -Headers $headers -Body @{ mod = $modName }
} catch {
    Write-Error "init_publish failed: $($_.Exception.Message)"
}

if ($response.error) {
    Write-Error "init_publish error: $($response.error) - $($response.message)"
}

$uploadUrl = $response.upload_url
Write-Host "Got upload URL."

$description = @"
# AmmoLoader 2.1

**This is a fork of [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader) by SilentCrim.**

The original mod has not been updated for Factorio 2.1. This fork contains only the changes required to make it work again on 2.1 — no new features, no gameplay changes.

## What was changed

- Updated for Factorio 2.1 (`factorio_version`, dependencies)
- Fixed logistic chest `robot_door` animation API
- Replaced deprecated `game.create_profiler()` calls
- Fixed save-load crash (`minable_flag`, `disabled_by_script` API)

## Original mod

- **Mod:** [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader)
- **Author:** SilentCrim
- **License:** GNU LGPLv3
- **Source:** https://github.com/ukaszstm/AmmoLoader

Please support the original author. If SilentCrim releases an official 2.1 update, prefer that version.

## Incompatibility

Do **not** enable this mod together with the original `ammo-loader` mod.

## Description (from original)

Storage chests that automatically load turrets, vehicles, and burner structures with ammo and fuel. Supports ammo/fuel upgrading, configurable range, chest filters, and more.
"@

$descFile = Join-Path $env:TEMP "ammoloader21-description.md"
$zipCurlPath = Convert-ToCurlPath $zipPath
$descCurlPath = Convert-ToCurlPath $descFile

[System.IO.File]::WriteAllText($descFile, $description)

try {
    # license must be API enum value: default_gnulgplv3 (not "LGPL-3.0")
    # description=<file reads content as form field (not file upload like @file)
    $curlArgs = @(
        "-s", "-S", "-X", "POST", $uploadUrl,
        "-F", "file=@$zipCurlPath",
        "-F", "description=<$descCurlPath",
        "-F", "license=default_gnulgplv3",
        "-F", "source_url=https://github.com/ukaszstm/AmmoLoader",
        "-F", "category=content"
    )

    Write-Host "Uploading $zipPath ..."
    $output = (& curl.exe @curlArgs 2>&1 | Out-String).Trim()
    $exitCode = $LASTEXITCODE

    if ($exitCode -ne 0) {
        Write-Host "Server response:"
        Write-Host $output
        throw "Upload failed with exit code $exitCode"
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

    Write-Host "Published successfully:"
    Write-Host $output
}
finally {
    Remove-Item $descFile -Force -ErrorAction SilentlyContinue
}
