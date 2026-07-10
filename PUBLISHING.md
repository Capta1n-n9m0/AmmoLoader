# Publishing

Repository: https://github.com/ukaszstm/AmmoLoader  
Mod page: https://mods.factorio.com/mod/ammoloader21

## Workflow for a new release

1. **Change the mod code** in `ammoloader21/`

2. **Bump version** in `ammoloader21/info.json`:
   ```json
   "version": "2.1.2"
   ```

3. **Add changelog entry** at the top of `ammoloader21/changelog.txt` (Factorio format)

4. **Test locally** — copy mod folder or zip to `%APPDATA%\Factorio\mods\`

5. **Commit and tag** (optional but recommended):
   ```powershell
   git add .
   git commit -m "Release 2.1.2"
   git tag v2.1.2
   git push origin master
   git push origin v2.1.2
   ```

6. **Publish to Factorio Mod Portal**:
   ```powershell
   $env:FACTORIO_TOKEN = "your-api-key"
   .\scripts\publish-factorio-update.ps1
   ```

   The update script automatically runs `package.ps1` first.

7. **Wait ~5 minutes** — the new version appears in-game.

---

## Scripts

| Script | When to use |
|--------|-------------|
| `package.ps1` | Build `dist/ammoloader21_<version>.zip` only |
| `publish-factorio.ps1` | **First-time** mod registration (already done) |
| `publish-factorio-update.ps1` | **Every subsequent release** |

## API key permissions

- First publish: **Publish Mods**
- Updates: **Upload Mods** (same key usually has both)

Create at https://factorio.com/profile

## Manual upload (alternative)

1. Run `.\scripts\package.ps1`
2. Go to https://mods.factorio.com/mod/ammoloader21
3. Upload `dist/ammoloader21_<version>.zip` under **Releases**

## Updating mod description / FAQ

Release upload only ships the zip. To change the portal description, edit it on the mod page or use the [Mod details API](https://wiki.factorio.com/Mod_details_API).

## GitHub release (optional)

Pushing a `v*` tag triggers `.github/workflows/release.yml` and attaches the zip to GitHub Releases.

```powershell
git tag v2.1.2
git push origin v2.1.2
```

## Packaging note (Windows)

Always use `package.ps1` (uses `tar.exe`). Do **not** use PowerShell `Compress-Archive` — Factorio rejects Windows-style backslashes in zips.
