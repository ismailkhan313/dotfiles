# --------------------------------
# .zshrc config -- viz1er 
# --------------------------------

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to XDG_CONFIG_HOME to .config location
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="code"

ZSH_THEME="half-life"

## PLUGINS ##
plugins=(git zsh-autocomplete zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

## ALIASES ##
alias ls='ls -lah'
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias storm='open -na "Webstorm.app" --args "$@"'
alias py='python3'
alias jwdl='py ~/Codebase/jwplayer-downloader/jwplayer_downloader.py'

## KEY BINDINGS ##
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# PATH EXPORTS
export PATH=$PATH:/Users/IXK673C/.spicetify

# Load Angular CLI autocompletion
source <(ng completion script)

# NVM lazy loaded
export NVM_DIR="$HOME/.config/nvm"
load_nvm() {
    unset -f nvm node npm npx
    export NVM_DIR="$HOME/.config/nvm"
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
