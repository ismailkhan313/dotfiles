# Claude Code

Global preferences for the Claude Code CLI: theme, notification and voice
settings, and enabled plugins/marketplaces (currently the Warp integration
plugin).

**Location**: `configs/claude`

## Restore

```bash
cp configs/claude/settings.json ~/.claude/settings.json
cp configs/claude/CLAUDE.md ~/.claude/CLAUDE.md
```

## What's deliberately excluded

Everything else under `~/.claude/` is conversation history or
machine-local state, not config — never version it:

- `projects/`, `sessions/`, `history.jsonl` — full conversation history
- `shell-snapshots/`, `telemetry/`, `cache/`, `backups/`, `downloads/`,
  `file-history/` — machine-local runtime state

`.mcp.json` (MCP server list) was also left out for now — it's secret-free
today (just a local server path) but MCP configs tend to grow API keys over
time, so check it by hand before ever adding it here.

`CLAUDE.md` here is intentionally generic (communication style, git rules,
workflow habits) since this repo is public — nothing work/company-specific
belongs in it. Work-only additions should live outside this repo (untracked
local edits, or a separate private repo), and get layered on top of this
file rather than replacing it.
