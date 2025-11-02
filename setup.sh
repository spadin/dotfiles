#! /bin/bash

# Install Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Clone dotfiles
if [ ! -d ~/dotfiles ]; then
  cd ~
  git clone https://github.com/spadin/dotfiles.git
fi
cd ~/dotfiles

# Load Homebrew in current shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew bundle
brew bundle --file=~/dotfiles/homebrew/Brewfile

# Configure git
git config --global user.name "Sandro Padin"
git config --global user.email "sandropadin@gmail.com"

# Stow dotfiles
cd ~/dotfiles
stow --restow karabiner
stow --restow terminal
stow --restow zsh
stow --restow alacritty

# Disable accented character suggestions and enables key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Put dock on the right-side of the screen and autohide it
defaults write com.apple.dock "orientation" -string "right"
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

# Create a karabiner.json file with a default profile used by goku
mkdir -p ~/.config/karabiner
if [ ! -f ~/.config/karabiner/karabiner.json ]; then
  echo '{"profiles": [{"name": "Default", "selected": true}]}' > ~/.config/karabiner/karabiner.json
fi

# Setup Karabiner by generating karabiner.json from karabiner.edn
goku