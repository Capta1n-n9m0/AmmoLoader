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

$description = @"
# AmmoLoader 2.1

**This is a fork of [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader) by SilentCrim.**

The original mod has not been updated for Factorio 2.1. This fork contains only the changes required to make it work again on 2.1 — no new features, no gameplay changes.

## What was changed (2.1.0)

- Updated for Factorio 2.1 (`factorio_version`, dependencies)
- Fixed logistic chest `robot_door` animation API
- Replaced deprecated `game.create_profiler()` calls

## Original mod

- **Mod:** [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader)
- **Author:** SilentCrim
- **License:** GNU LGPLv3

Please support the original author. If SilentCrim releases an official 2.1 update, prefer that version.

## Incompatibility

Do **not** enable this mod together with the original `ammo-loader` mod.

## Description (from original)

Storage chests that automatically load turrets, vehicles, and burner structures with ammo and fuel. Supports ammo/fuel upgrading, configurable range, chest filters, and more.
"@

$form = @{
    file = Get-Item $zipPath
    description = $description
    license = "LGPL-3.0"
    source_url = "https://github.com/ukaszstm/AmmoLoader"
    category = "content"
}

$result = Invoke-RestMethod -Uri $uploadUrl -Method Post -Form $form
Write-Host "Published successfully: $($result | ConvertTo-Json -Compress)"
