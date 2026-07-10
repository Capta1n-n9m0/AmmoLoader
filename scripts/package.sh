#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MOD_DIR="$ROOT/ammoloader21"
DIST_DIR="$ROOT/dist"
MOD_NAME="ammoloader21"

VERSION="$(grep -o '"version": *"[^"]*"' "$MOD_DIR/info.json" | head -1 | sed 's/.*"\([^"]*\)"$/\1/')"
ZIP_PATH="$DIST_DIR/${MOD_NAME}_${VERSION}.zip"

mkdir -p "$DIST_DIR"
rm -f "$ZIP_PATH"

# Package only mod files, excluding dev artifacts
cd "$MOD_DIR"
zip -r "$ZIP_PATH" . \
  -x ".gitignore" \
  -x "config.ld" \
  -x "console.txt" \
  -x "luaFormatterConfig.ini" \
  -x "regex.txt"

echo "Created $ZIP_PATH"
