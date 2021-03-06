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

# ls with colors
alias ls='ls --color'
alias ll='ls --color -alhu'

# start postgres
alias pgstart='postgres -D /usr/local/var/postgres'

# start redis-server
alias redstart='redis-server /usr/local/etc/redis.conf'
