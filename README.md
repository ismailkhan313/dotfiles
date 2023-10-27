## Dotfiles

This repo contains my startup files when booting up a fresh machine.

# Install fonts

I use JetBrains Mono NL and FiraCode.

# Install iTerm2

All install items are in configs/iterm2

1. Import profile settings (viz1er.json) from directory.
2. Import color schemes in profile settings.

# Install oh-my-zsh

All install items in configs/zsh

1. Run `sudo ./install-zsh.sh` in the configs file.
2. Install autocomplete plugin `sudo git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete`
3. Install syntax highlighting plugin `sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
4. Open .zshrc `code ~/.zshrc`
5. Replace all contents with the preset .zshrc file in zsh directory.
