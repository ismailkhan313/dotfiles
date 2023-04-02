#!/bin/bash
# script to install vscode extensions
# check all vscode extensions installed => code --list-extensions | xargs -L 1

# execute command with sudo bash install-extensions.sh
# -------------------
curl -s https://raw.githubusercontent.com/viz1er/dotfiles/main/vscode/install-extensions.sh | /bin/bash

extensions=(
  bungcip.better-toml
  eamodio.gitlens
  enkia.tokyo-night
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  redhat.vscode-yaml
  vscodevim.vim
  Yummygum.city-lights-icon-vsc
)

echo "Installing ${#extensions[@]} extensions onto vscode..." 

for i in ${extensions[@]}; do
  code --install-extension $i
done 