# --------------------------------
# .zshrc config -- viz1er 
# --------------------------------

echo "hello friend"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to XDG_CONFIG_HOME to .config location
export XDG_CONFIG_HOME="$HOME/.config"

# Starship.rs tokyo-night prompt will default over this. This theme only occurs as a backup. 
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

# Auto update behaviour 
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 0

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"

# PLUGINS
plugins=(git zsh-autocomplete zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ALIASES
alias ls='ls -lah'
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias storm='open -na "Webstorm.app" --args "$@"'
alias py='python3'

# KEY BINDINGS 
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# PATH EXPORTS
export PATH=$PATH:/Users/IXK673C/.spicetify
export PATH=/Users/IXK673C/.local/bin:$PATH # path for lvim

export PATH=$PATH:/Users/IXK673C/GCP/cloud-sql-proxy # work 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/IXK673C/GCP/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/IXK673C/GCP/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/IXK673C/GCP/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/IXK673C/GCP/google-cloud-sdk/completion.zsh.inc'; fi

