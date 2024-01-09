#!/bin/bash

# THIS IS NOT DONE - STILL IN PROGRESS JAN 2024

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Ensure Homebrew is installed
if ! command_exists brew; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# Install Spicetify
echo "Installing Spicetify..."
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh

# Clone and apply Spicetify Themes
echo "Applying Spicetify themes..."
cd ~/.config/spicetify/Themes
git clone --depth=1 https://github.com/spicetify/spicetify-themes.git 
cp -r spicetify-themes/* ~/.config/spicetify/Themes
$ rm -rf spicetify-themes

spicetify config current_theme text
spicetify config color_scheme CatppuccinMocha

# Apply Spicetify
spicetify
spicetify backup apply enable-devtool

echo "Spicetify installation is complete."
