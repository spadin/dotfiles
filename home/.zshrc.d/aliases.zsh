# git aliases
hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

alias gco='git checkout'
alias gb='git branch'
alias gst='git status -sb'

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ggpull='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

# bundle alias
alias be='bundle exec'
