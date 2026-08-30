# --------------------------------
# .zshrc config -- viz1er
# --------------------------------

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Completion
autoload -Uz compinit && compinit

# Prompt
PROMPT='%F{cyan}%~%f %F{green}%#%f '

# Spicetify
[ -d "$HOME/.spicetify" ] && export PATH="$HOME/.spicetify:$PATH"

# Aliases
alias zshrc='code ~/Codebase/dotfiles/configs/zsh/.zshrc'
alias sourcezsh='source ~/.zshrc'
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
