# Global preferences

Applies across every project. Anything project-specific belongs in that
project's own `CLAUDE.md`, not here.

## Communication

- Be terse. Don't summarize what you just did at the end of a response —
  the diff/output already shows it.
- Ask before acting only when genuinely blocked (missing info, a decision
  only I can make, or a destructive/hard-to-reverse action). Otherwise make
  the reasonable call and keep going.
- Flag tradeoffs and assumptions inline instead of silently picking one.

## Git

- Always create a new commit rather than amending, unless I explicitly ask
  for `--amend`.
- Never `push --force` to a shared branch, skip hooks, or bypass signing
  without explicit confirmation each time.
- Don't stage or commit unless I ask — surfacing a diff and asking is fine,
  committing on your own isn't.
- Write commit messages that explain *why*, not a restatement of the diff.

## Workflow

- Don't add abstractions, error handling, or config options for cases that
  can't currently happen. Match the scope of the actual ask.
- When something is ambiguous, prefer reading the surrounding code/repo
  over guessing.
- Run the relevant tests/build before calling a change done, when that's
  feasible.

## Tools

- Prefer `rg` over `grep`, `fd` over `find`, when available.
