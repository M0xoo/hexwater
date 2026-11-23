#!/usr/bin/env bash
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/M0xoo/hexwater/main/hexwater"
INSTALL_DIR="${HEXWATER_INSTALL_DIR:-$HOME/.local/bin}"
TARGET="$INSTALL_DIR/hexwater"

mkdir -p "$INSTALL_DIR"
curl -fsSL "$REPO_RAW" -o "$TARGET"
chmod +x "$TARGET"

echo "✓ Installed hexwater to $TARGET"
case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *) echo "  (Add 'export PATH=\"$INSTALL_DIR:\$PATH\"' to your ~/.zshrc to run 'hexwater' from anywhere)" ;;
esac

exec "$TARGET" "$@"
