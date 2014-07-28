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

if [ -x run-help ]; then
  unalias run-help
  autoload run-help
fi

HELPDIR=/usr/local/share/zsh/helpfiles

for config_file ($HOME/.zshrc.d/*.zsh) source $config_file

# add homebrew path
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# add coreutils path
if [ `uname` = "Darwin" ]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
fi

# initialize rbenv
export PATH=$HOME/.rbenv/bin:$PATH
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
setopt NO_HIST_VERIFY
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
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier.d"
eval "$(tmuxifier init -)"

export EDITOR=vim
bindkey -e

# Set JAVA_HOME on OS X
if [ `uname` = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi
