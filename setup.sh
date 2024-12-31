#! /bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone dotfiles
cd ~
git clone https://github.com/spadin/dotfiles.git
cd dotfiles

# Load Homebrew in current shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew bundle
brew bundle --file=~/dotfiles/homebrew/Brewfile

# Stow dotfiles
cd ~/dotfiles
stow git
stow karabiner
stow terminal

# Setup Karabiner by generating karabiner.json from karabiner.edn
goku

# Disable accented character suggestions and enables key repeat
defaults write -g ApplePressAndHoldEnabled -bool false