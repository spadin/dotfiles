# MacOS Setup

## Initial Setup

Run the following command to install Homebrew and dotfiles

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/spadin/dotfiles/main/setup.sh)"
```

## Manual Steps

Open the following apps to setup and accept the various permission prompts

* Karabiner-Elements
* Raycast
* 1Password
* Google Chrome

## Disable accented character suggestions and enables key repeat

```
defaults write -g ApplePressAndHoldEnabled -bool false
```