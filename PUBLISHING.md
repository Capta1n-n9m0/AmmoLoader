# GitHub publish (one-time setup)

1. Log in to GitHub CLI:
   ```powershell
   gh auth login
   ```

2. Create the repository and push:
   ```powershell
   cd c:\Users\ukasz\projects\AmmoLoader
   gh repo create ammoloader21 --public --description "Ammo Loader fork for Factorio 2.1" --source=. --remote=origin --push
   ```

3. Create a release with the mod zip:
   ```powershell
   .\scripts\package.ps1
   gh release create v2.1.0 dist\ammoloader21_2.1.0.zip --title "2.1.0" --notes "Initial Factorio 2.1 release"
   ```

# Factorio Mod Portal publish (one-time setup)

1. Go to https://factorio.com/profile and create an API key with **Publish Mods** permission.

2. Publish:
   ```powershell
   $env:FACTORIO_TOKEN = "your-api-key-here"
   .\scripts\publish-factorio.ps1
   ```

Alternatively upload manually at https://mods.factorio.com/mod/new
