# Publishing

Repository: https://github.com/ukaszstm/AmmoLoader

## Package locally

```powershell
.\scripts\package.ps1
```

```bash
./scripts/package.sh
```

Output: `dist/ammoloader21_<version>.zip`

## GitHub release (automated)

Push a version tag to trigger the release workflow:

```bash
git tag v2.1.0
git push origin v2.1.0
```

Or run **Actions → Release → Run workflow** manually to get a zip artifact.

## Factorio Mod Portal

### First-time publish

1. Go to https://factorio.com/profile and create an API key with **Publish Mods** permission.
2. Run:

```powershell
$env:FACTORIO_TOKEN = "your-api-key"
.\scripts\publish-factorio.ps1
```

Or upload manually at https://mods.factorio.com/mod/new with `dist/ammoloader21_2.1.0.zip`.

Use the text from [MOD_DESCRIPTION.md](MOD_DESCRIPTION.md) as the mod description.

### Subsequent releases

Use the upload API (see [Mod upload API](https://wiki.factorio.com/Mod_upload_API)) or upload a new release zip on the mod page.

## Required secrets (optional CI → Factorio)

To auto-publish to the Factorio portal from GitHub Actions (like Maraxsis), add `FACTORIO_TOKEN` to repository secrets. The current workflow only packages and attaches the zip to GitHub Releases.
