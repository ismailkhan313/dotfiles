# ZSH

Plain zsh — no framework, no plugins, no symlinks.

- `.zshenv` — env vars, sourced by every zsh shell (interactive or not)
- `.zprofile` — sourced once per login shell (Homebrew, PATH)
- `.zshrc` — sourced by every interactive shell (history, completion, prompt, aliases, keybindings, NVM lazy-load)

## Usage

These files are **not** symlinked into `~`. They're the source of truth here in the
repo; the live copies in `~/.zshenv`, `~/.zprofile`, and `~/.zshrc` are independent
files you copy by hand:

```sh
# repo -> live
cp configs/zsh/.zshenv ~/.zshenv
cp configs/zsh/.zprofile ~/.zprofile
cp configs/zsh/.zshrc ~/.zshrc

# live -> repo (after tweaking your live config)
cp ~/.zshenv configs/zsh/.zshenv
cp ~/.zprofile configs/zsh/.zprofile
cp ~/.zshrc configs/zsh/.zshrc
```

Run `sourcezsh` (aliased in `.zshrc`) or open a new shell to pick up changes.
