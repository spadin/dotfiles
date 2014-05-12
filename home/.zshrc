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

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source $HOME/.zshrc.d/theme.zsh
source $HOME/.zshrc.d/aliases.zsh

# add homebrew path
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# add coreutils path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# directory colors
eval `dircolors $HOME/.dir_colors`

# zsh history options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt SHARE_HISTORY

# other zsh options
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

# i can typez mysefl
unsetopt CORRECT
unsetopt CORRECT_ALL

# docker  setup
export DOCKER_HOST=tcp://localhost:4243

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# tmuxifier setup
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier.d"
