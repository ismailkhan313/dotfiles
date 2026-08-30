# Sourced once for login shells

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Maximize every new Terminal.app window on open
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    (osascript -e 'tell application "Terminal" to set zoomed of front window to true' &>/dev/null &)
fi
