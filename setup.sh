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
stow zsh

# Setup Karabiner by generating karabiner.json from karabiner.edn
goku

# Disable accented character suggestions and enables key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Put dock on the right-side of the screen and autohide it
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "autohide" -bool "true"

# Only show open applications in the dock
defaults write com.apple.dock "static-only" -bool "true"

# Top right corner: Lock screen
defaults write com.apple.dock wvous-tr-corner -int 13

# Bottom right corner: Show desktop
defaults write com.apple.dock wvous-br-corner -int 4

# Bottom left corner: Show desktop
defaults write com.apple.dock wvous-bl-corner -int 4

# Restart Dock
killall Dock
