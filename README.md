# My Dotfiles

Welcome to my dotfiles repository! Here, you'll find my preferred startup configurations for booting up a fresh machine. If you're interested in using or exploring my setup, follow the steps below. Remember, always review the code/scripts before running them.

## Prerequisites:

- Familiarity with the terminal or command prompt.
- Make sure you have administrative permissions.

## Contents:

- **Fonts**: JetBrains Mono NL & FiraCode.
- **iTerm2**: Custom profiles and color schemes.
- **zsh**: Plain zsh config (no framework) — see `configs/zsh/README.md`.
- **Terminal.app**: Always opens maximized — see `configs/terminal/README.md`.
- **Warp**: Exported `settings.toml` — see `configs/warp/README.md`.
- **Claude Code**: Global `settings.json` — see `configs/claude/README.md`.

## Setup:

### 1. Install Fonts:

- JetBrains Mono NL
- FiraCode

Install from https://www.nerdfonts.com/

### 2. Setup iTerm2:

Make your terminal feel at home with my customizations.

**Location**: `configs/iterm2`

**Steps**:

a. Import profile settings: - Use the `viz1er.json` file from the `configs/iterm2` directory.

b. Import color schemes: - Navigate to iTerm2 preferences and import the desired color schemes.

### 3. Set up zsh:

Plain zsh, no framework or plugins.

**Location**: `configs/zsh`

**Steps**:

```bash
cp configs/zsh/.zshenv ~/.zshenv
cp configs/zsh/.zprofile ~/.zprofile
cp configs/zsh/.zshrc ~/.zshrc
```

See `configs/zsh/README.md` for details on the file layout and how to sync
changes back to the repo.

### 4. Set up Warp:

**Location**: `configs/warp`

**Steps**:

```bash
cp configs/warp/settings.toml ~/.warp/settings.toml
```

See `configs/warp/README.md` for what's in the file and what's deliberately
left out.

### 5. Set up Claude Code:

**Location**: `configs/claude`

**Steps**:

```bash
cp configs/claude/settings.json ~/.claude/settings.json
cp configs/claude/CLAUDE.md ~/.claude/CLAUDE.md
```

See `configs/claude/README.md` for what's included and what's deliberately
left out (conversation history, MCP configs, etc.).

### 6. Install from Brewfile

`brew bundle dump` creates Brewfile in the current directory from currently-installed packages
Navigate to dotfiles directory (/Codebase/dotfiles/configs)

`brew bundle` installs everything from the Brewfile

`brew bundle --help` for more options

## Note:

Make sure to source or restart your terminal after performing these steps to see the changes in effect.
