# --------------------------------
# .zshrc config -- viz1er 
# --------------------------------

# Oh My Zsh Configuration
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
ZSH_THEME="dst"
plugins=(git zsh-autocomplete zsh-syntax-highlighting web-search autojump)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source $ZSH/oh-my-zsh.sh

# Environment Variables
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.config/nvm"
export EDITOR="code"

# PATH Configuration
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Users/IXK673C/.spicetify"
export PATH="/opt/homebrew/bin:$PATH"

# Aliases
alias ls='exa -lah --created --icons'
alias exatree='exa --tree --long --icons'
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias storm='open -na "Webstorm.app" --args "$@"'
alias py='python3'
alias jwdl='py ~/Codebase/jwplayer-downloader/jwplayer_downloader.py'
alias zshrc='code ~/.config/zsh'
alias sourcezsh='source ~/.config/zsh/.zshrc'
alias dotfiles='code ~/Codebase/dotfiles/configs'

# Key Bindings
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Node Version Manager (NVM) Lazy Loading
load_nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() {
    load_nvm
    nvm "$@"
}

node() {
    load_nvm
    node "$@"
}

npm() {
    load_nvm
    npm "$@"
}

npx() {
    load_nvm
    npx "$@"
}
