# SketchRoot Google Ads

A standalone workspace for planning, launching, measuring, and optimizing paid acquisition for [SketchRoot](https://sketchroot.com), a dental education platform.

> **Scope:** Google Ads planning and campaign operations only. This repository is separate from `Sketchroot_scene_lab` and `Opg-surgical-planner`.

## Objectives
- Acquire relevant dental students, dentists, and dental licensing-exam aspirants.
- Validate demand with tightly themed Search campaigns before expanding.
- Track meaningful actions, not clicks alone.
- Document experiments, decisions, budgets, and results so campaigns are reproducible.

## Repository map
- `strategy/` — audience, positioning, campaign principles.
- `keyword-research/` — seed terms, intent, negatives, validation workflow.
- `campaigns/` — campaign structure and launch checklist.
- `ad-creatives/` — responsive search ad copy and creative briefs.
- `conversion-tracking/` — measurement plan and QA.
- `analytics/` — reporting definitions and optimization cadence.
- `reports/` — dated performance reports (add only verified account data).
- `docs/google-ads-mcp.md` — how Claude Code connects to the Google Ads API (MCP server, credentials).

## Before launch
1. Confirm the product features and offers currently available on SketchRoot.com.
2. Validate keyword volume, competition, policy eligibility, and location targeting in Google Keyword Planner.
3. Set an approved daily budget and target geography.
4. Configure consent/privacy notices and conversion tracking.
5. Test every landing page and conversion action.
6. Launch with a controlled budget; review search terms and lead quality frequently.

## Claude Code ↔ Google Ads
Claude Code sessions in this repo load the open-source [google-ads-mcp](https://github.com/promobase/google-ads-mcp) server (`.mcp.json`), which can read reports and create or edit campaigns. Credentials are set as environment variables, never committed. See [`docs/google-ads-mcp.md`](docs/google-ads-mcp.md).

## Guardrails
- Do not commit passwords, API keys, customer personal data, or Google Ads credentials.
- Do not claim features, outcomes, accreditations, or exam success rates unless verified.
- Mark estimates as estimates; never fabricate campaign performance.
- Follow Google Ads policies and applicable privacy requirements.

## Status
Planning baseline. No live account metrics or campaign results are represented in this repository yet.
