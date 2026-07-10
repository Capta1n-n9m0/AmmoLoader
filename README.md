[![](https://img.shields.io/badge/dynamic/json?color=orange&label=Factorio&query=downloads_count&suffix=%20downloads&url=https%3A%2F%2Fmods.factorio.com%2Fapi%2Fmods%2Fammoloader21&style=for-the-badge)](https://mods.factorio.com/mod/ammoloader21)
[![](https://img.shields.io/github/v/release/ukaszstm/AmmoLoader?label=Release&style=for-the-badge)](https://github.com/ukaszstm/AmmoLoader/releases)
[![](https://img.shields.io/github/issues/ukaszstm/AmmoLoader?label=Bug%20Reports&style=for-the-badge)](https://github.com/ukaszstm/AmmoLoader/issues)

# AmmoLoader 2.1

**Fork of [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader) by [SilentCrim](https://mods.factorio.com/user/silentcrim).**

The original mod has not been updated for Factorio 2.1. This repository contains a minimal fork — only compatibility fixes, no new features or gameplay changes.

If SilentCrim releases an official 2.1 update, prefer that version.

---

## What does this mod do?

Special storage chests that automatically load nearby turrets, vehicles, and burner structures with ammo and fuel.

- Loads turrets and armed vehicles with ammo
- Loads vehicles and burner structures with fuel
- Upgrades ammo/fuel when better versions become available
- Returns ammo/fuel to chests when entities are picked up
- Highly customizable through in-game mod settings
- Configurable range (infinite by default)
- Per-chest and per-entity filters

### How to use

1. Complete the required research
2. Place a loader chest
3. Fill it with ammo or fuel
4. Turrets and vehicles in range are loaded automatically

**Note:** Trains, burner structures, and artillery are disabled by default — enable them in mod settings.

---

## Compatibility

| | |
|---|---|
| **Factorio** | 2.1+ |
| **Space Age** | Not required |
| **Incompatible with** | original [`ammo-loader`](https://mods.factorio.com/mod/ammo-loader) mod |

Do **not** enable both mods at once.

---

## Installation

### Factorio Mod Portal

Search for **AmmoLoader 2.1** (`ammoloader21`) in the in-game mod manager.

### Manual

1. Download `ammoloader21_X.X.X.zip` from [Releases](https://github.com/ukaszstm/AmmoLoader/releases)
2. Copy to your Factorio mods folder:
   - Windows: `%APPDATA%\Factorio\mods\`
   - Linux: `~/.factorio/mods/`
   - macOS: `~/Library/Application Support/factorio/mods/`
3. Enable the mod and restart Factorio

---

## Development

### Package release zip

```powershell
.\scripts\package.ps1
```

```bash
./scripts/package.sh
```

Output: `dist/ammoloader21_<version>.zip`

### Publish

See [PUBLISHING.md](PUBLISHING.md).

---

## Changes in this fork (2.1.0)

- Updated `factorio_version` and dependencies for Factorio 2.1
- Fixed logistic chest `robot_door` animation API
- Replaced deprecated `game.create_profiler()` calls

[Full changelog](ammoloader21/changelog.txt)

---

## Credits

See [Credits.md](Credits.md).

- **Original mod:** [SilentCrim](https://mods.factorio.com/user/silentcrim) — [Ammo Loader+](https://mods.factorio.com/mod/ammo-loader)
- **Graphics:** [BiusArt](https://mods.factorio.com/user/BiusArt) (from original mod)
- **2.1 fork:** [ukaszstm](https://github.com/ukaszstm)

---

## License

GNU **LGPLv3** — see [LICENSE.md](LICENSE.md).

This fork is based on Ammo Loader+ by SilentCrim. Modifications for Factorio 2.1 compatibility by ukaszstm.
