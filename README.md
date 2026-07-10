# AmmoLoader 2.1

Fork of [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader) by SilentCrim, updated for **Factorio 2.1**.

Automatically loads turrets, vehicles, and burner structures with ammo and fuel from special loader chests.

## Compatibility

- **Factorio:** 2.1+
- **Incompatible with:** original `ammo-loader` mod (do not enable both at once)

## Installation

### From Factorio Mod Portal

Search for **AmmoLoader 2.1** (`ammoloader21`) in the in-game mod manager.

### Manual

1. Download `ammoloader21_2.1.0.zip` from [Releases](https://github.com/ukaszstm/ammoloader21/releases)
2. Place it in your Factorio mods folder:
   - Windows: `%APPDATA%\Factorio\mods\`
   - Linux: `~/.factorio/mods/`
   - macOS: `~/Library/Application Support/factorio/mods/`
3. Enable the mod in Factorio and restart

## Building a release zip

```powershell
.\scripts\package.ps1
```

This creates `dist/ammoloader21_2.1.0.zip` ready for upload.

## Changes from original (2.1.0)

- Updated `factorio_version` to 2.1
- Fixed logistic chest `robot_door` animation API
- Replaced deprecated `game.create_profiler()` calls

## License

This fork is based on Ammo Loader+ which is licensed under **GNU LGPLv3**. See [LICENSE](LICENSE).

Original mod: https://mods.factorio.com/mod/ammo-loader  
Original author: SilentCrim

## Credits

- **Original mod:** SilentCrim — Ammo Loader+
- **2.1 fork:** ukaszstm
