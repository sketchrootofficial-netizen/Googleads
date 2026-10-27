#!/usr/bin/env bash
# Installs promobase/google-ads-mcp (MIT) at a pinned commit into .vendor/.
# Safe to run repeatedly. All output goes to stderr so it never corrupts MCP stdio.
set -euo pipefail
exec 1>&2

REPO_URL="https://github.com/promobase/google-ads-mcp.git"
PINNED_COMMIT="d21eb4abd71ac163aee4fb031244e19a313fd93f"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/.vendor/google-ads-mcp"

if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ ! -d "$DEST/.git" ]; then
  git clone -q "$REPO_URL" "$DEST"
fi
if [ "$(git -C "$DEST" rev-parse HEAD)" != "$PINNED_COMMIT" ]; then
  git -C "$DEST" fetch -q origin "$PINNED_COMMIT" 2>/dev/null || git -C "$DEST" fetch -q origin
  git -C "$DEST" checkout -q "$PINNED_COMMIT"
fi

(cd "$DEST" && uv sync -q)

# The server refuses to start without a .env file, even when credentials
# come from the environment, so make sure an (empty) one exists.
touch "$DEST/.env"
echo "google-ads-mcp ready at $DEST"
