#!/usr/bin/env bash
# Claude Code statusline: model | context % used | session cost
# Reads the hook JSON on stdin; context is computed from the session transcript.
set -uo pipefail

input=$(cat)

python3 - "$input" <<'PY'
import json, os, sys

try:
    d = json.loads(sys.argv[1])
except Exception:
    print("statusline: bad input")
    sys.exit(0)

RESET = "\033[0m"
DIM   = "\033[2m"
CYAN  = "\033[36m"

def color_for(pct):
    if pct >= 85: return "\033[31m"   # red
    if pct >= 60: return "\033[33m"   # yellow
    return "\033[32m"                 # green

# --- model ---
model = (d.get("model") or {}).get("display_name") or "?"

# --- context window size ---
model_id = (d.get("model") or {}).get("id") or ""
limit = 1_000_000 if "[1m]" in model_id else 200_000

# --- context used: last assistant usage in the transcript ---
used = None
tp = d.get("transcript_path")
if tp and os.path.exists(tp):
    try:
        with open(tp, "r", encoding="utf-8", errors="replace") as f:
            lines = f.readlines()
        for line in reversed(lines):
            line = line.strip()
            if not line or '"usage"' not in line:
                continue
            try:
                e = json.loads(line)
            except Exception:
                continue
            if e.get("type") != "assistant" or e.get("isSidechain"):
                continue
            u = (e.get("message") or {}).get("usage") or {}
            if not u:
                continue
            used = (u.get("input_tokens", 0)
                    + u.get("cache_read_input_tokens", 0)
                    + u.get("cache_creation_input_tokens", 0))
            break
    except Exception:
        used = None

parts = [f"{CYAN}{model}{RESET}"]

if used is not None:
    pct = used / limit * 100
    c = color_for(pct)
    parts.append(f"{c}{pct:.0f}% ctx{RESET} {DIM}({used//1000}k/{limit//1000}k){RESET}")
else:
    parts.append(f"{DIM}-- ctx{RESET}")

# --- cost ---
cost = (d.get("cost") or {}).get("total_cost_usd")
if isinstance(cost, (int, float)):
    parts.append(f"${cost:.2f}")

print(f" {DIM}|{RESET} ".join(parts))
PY
