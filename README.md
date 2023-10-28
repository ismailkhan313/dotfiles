# My Dotfiles

Welcome to my dotfiles repository! Here, you'll find my preferred startup configurations for booting up a fresh machine. If you're interested in using or exploring my setup, follow the steps below. Remember, always review the code/scripts before running them.

## Prerequisites:

-   Familiarity with the terminal or command prompt.
-   Make sure you have administrative permissions.

## Contents:

-   **Fonts**: JetBrains Mono NL & FiraCode.
-   **iTerm2**: Custom profiles and color schemes.
-   **oh-my-zsh**: Configurations, plugins, and scripts for a better Zsh experience.

## Setup:

### 1. Install Fonts:

-   JetBrains Mono NL
-   FiraCode

### 2. Setup iTerm2:

Make your terminal feel at home with my customizations.

**Location**: `configs/iterm2`

**Steps**:

a. Import profile settings: - Use the `viz1er.json` file from the `configs/iterm2` directory.

b. Import color schemes: - Navigate to iTerm2 preferences and import the desired color schemes.

### 3. Integrate oh-my-zsh:

Boost your Zsh experience with these plugins and configurations.

**Location**: `configs/zsh`

**Steps**:

a. Install oh-my-zsh:
`bash
    sudo ./install-zsh.sh
    `

b. Install autocomplete plugin:
`bash
    sudo git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
    `

c. Install syntax highlighting plugin:
`bash
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    `

d. Replace `.zshrc` with my custom configurations:
`bash
    cp configs/zsh/.zshrc ~/.zshrc
    `

## Note:

Make sure to source or restart your terminal after performing these steps to see the changes in effect.
