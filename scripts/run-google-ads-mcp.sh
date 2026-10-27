#!/usr/bin/env bash
# Launched by .mcp.json. Installs the server on first use, then runs it over stdio.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/.vendor/google-ads-mcp"
export PATH="$HOME/.local/bin:$PATH"

if [ ! -f "$DEST/.env" ] || [ ! -d "$DEST/.venv" ]; then
  bash "$ROOT/scripts/install-google-ads-mcp.sh"
fi

if [ -z "${GOOGLE_ADS_DEVELOPER_TOKEN:-}" ]; then
  echo "google-ads-mcp: GOOGLE_ADS_DEVELOPER_TOKEN is not set; see README.md" >&2
fi

cd "$DEST"
exec uv run --quiet main.py --groups "${GOOGLE_ADS_MCP_GROUPS:-all}"
