# Terminal.app

Every new window opens maximized (fills the whole screen below the menu bar).

There's no static Terminal.app preference for "always maximize" — the
`NSWindow Frame TTWindow <profile>` autosave key looks like it should do
this, but macOS ignores it for freshly-opened windows in modern versions.
The reliable way is to ask Terminal to zoom its own window right after the
shell starts.

That's implemented as a small hook in [`configs/zsh/.zprofile`](../zsh/.zprofile),
since Terminal starts a login shell for every new window/tab:

```sh
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    (osascript -e 'tell application "Terminal" to set zoomed of front window to true' &>/dev/null &)
fi
```

Guarded by `$TERM_PROGRAM` so it only fires inside Terminal.app (not
iTerm2, VS Code, SSH sessions, etc.), and backgrounded so it never delays
the shell prompt.
