# Google Ads MCP server

This repo connects Claude Code to Google Ads using the open-source
[promobase/google-ads-mcp](https://github.com/promobase/google-ads-mcp) server (MIT, Google Ads API v20).
It has read and write access: it can create and edit campaigns, budgets, ads, keywords, assets and conversions, and run GAQL reports.

## How it works

- `.mcp.json` registers the `google-ads` MCP server.
- `scripts/install-google-ads-mcp.sh` clones the server at a pinned commit into `.vendor/` and installs its dependencies with `uv`.
  A SessionStart hook in `.claude/settings.json` runs it when a session starts.
- `scripts/run-google-ads-mcp.sh` starts the server over stdio, loading the groups in `GOOGLE_ADS_MCP_GROUPS` (default `all`).

## Credentials

Set these as environment secrets (never commit them). See `.env.example`.

| Variable | Where to get it |
|---|---|
| `GOOGLE_ADS_DEVELOPER_TOKEN` | Google Ads manager account → Admin → API Center |
| `GOOGLE_ADS_CLIENT_ID` / `GOOGLE_ADS_CLIENT_SECRET` | Google Cloud Console → APIs & Services → Credentials → OAuth client ID (Desktop app). Enable the Google Ads API in the same project. |
| `GOOGLE_ADS_REFRESH_TOKEN` | Generate it once with the client ID/secret, e.g. using Google's `generate_user_credentials.py` example from the google-ads-python repo |
| `GOOGLE_ADS_LOGIN_CUSTOMER_ID` | Optional. Your manager (MCC) account ID, digits only, if you access accounts through one |

A new developer token starts at **Test** access and only works on test accounts.
To use real accounts, apply for Basic access in the API Center.

## Safety

The server can spend money. Ask Claude to create campaigns **paused**, then review them in the Google Ads UI before enabling.
