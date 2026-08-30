# --------------------------------
# .zshrc config -- viz1er
# --------------------------------

# Set up Homebrew environment. This should be at the top.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Oh My Zsh Configuration
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(git zsh-autocomplete zsh-syntax-highlighting web-search autojump)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source $ZSH/oh-my-zsh.sh

# Environment Variables
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.config/nvm"
export EDITOR="code"

# NPM global packages
NPM_PACKAGES_PATH="$(npm config get prefix)/bin"
if [ -d "$NPM_PACKAGES_PATH" ]; then
  export PATH="$NPM_PACKAGES_PATH:$PATH"
fi

# Spicetify
if [ -d "/Users/viz1er/.spicetify" ]; then
    export PATH="/Users/viz1er/.spicetify:$PATH"
fi

# Aliases
alias zshrc='code ~/Codebase/dotfiles/configs/zsh/.zshrc'
alias sourcezsh='source ~/.zshrc' # Corrected to source the symlink
alias dotfiles='code ~/Codebase/dotfiles/configs'
alias exatree='eza --tree --long --icons'
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias storm='open -na "Webstorm.app" --args "$@"'
alias py='python3'
alias jwdl='py ~/Codebase/jwplayer-downloader/jwplayer_downloader.py'
alias ls='eza --long --all --header --git --group-directories-first'

# Key Bindings
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Node Version Manager (NVM) Lazy Loading
load_nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { load_nvm; nvm "$@"; }
node() { load_nvm; node "$@"; }
npm() { load_nvm; npm "$@"; }
npx() { load_nvm; npx "$@"; }