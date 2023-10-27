#!/bin/bash
# runs for macos and linux operating systems
# install in terminal with sudo ./install-zsh.sh

# create .zshrc in home dir
cd $HOME
touch ~/.zshrc

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# remove example files from custom folder
rm -rf $ZSH_CUSTOM/example.zsh
rm -rf $ZSH_CUSTOM/plugins/example
rm -rf $ZSH_CUSTOM/themes/example.zsh-theme

# install zsh custom plugins: zsh-auto-complete and zsh-syntax-highlighting
# setup ssh key with git before this 
# don't install from brew to keep it operating system agnostic. these plugins installed from brew won't interact with .zshrc custom plugin folder
cd $ZSH_CUSTOM/plugins
git clone git@github.com:marlonrichert/zsh-autocomplete.git
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# .zshrc will have these plugins already included 

# symlink repo .zshrc to local .zshrc
# .zshrc must not exist for symlink to work in ~/
echo "Creating symlink to .zshrc in home directory."
ln -s ~/Codebase/dotfiles/configs/.zshrc ~/.zshrc
echo "Success!!!" 

## exit 
