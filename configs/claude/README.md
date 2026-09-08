# Claude Code

Global preferences for the Claude Code CLI: model, permission mode, theme,
notification and voice settings, the statusline, and enabled
plugins/marketplaces (currently the Warp integration plugin).

**Location**: `configs/claude`

## Restore

```bash
cp configs/claude/settings.json ~/.claude/settings.json
cp configs/claude/CLAUDE.md ~/.claude/CLAUDE.md
cp configs/claude/statusline-command.sh ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

All four lines matter: `settings.json` points `statusLine.command` at
`~/.claude/statusline-command.sh`, so skipping the last two leaves the
statusline broken on a fresh machine.

## Statusline

`statusline-command.sh` renders `model | context % used | session cost`:

```
Opus 5 | 5% ctx (47k/1000k) | $0.42
```

Context is read from the live session transcript's most recent assistant
`usage` block (`input_tokens + cache_read_input_tokens +
cache_creation_input_tokens`), so it's the real number rather than an
estimate. The window size is detected from the model id — `1000k` for a
`[1m]` model, `200k` otherwise. The percentage turns yellow at 60% and red
at 85%. If the transcript can't be read it prints `-- ctx` rather than
failing, since a non-zero exit would blank the whole statusline.

Cost comes from `total_cost_usd` on the hook payload and is omitted when
Claude Code doesn't supply it (e.g. subscription sessions).

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
