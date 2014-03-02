#!/bin/zsh

# defines the homeshick function
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# adds homeshick completion path
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# completion
autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
