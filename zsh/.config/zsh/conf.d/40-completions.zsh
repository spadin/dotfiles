#compdef newt
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

_newt_bash_autocomplete() {
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$( NEWT_QUIET=1 NEWT_OFFLINE=1 NEWT_DISABLE_DAEMON=1 ${COMP_WORDS[0]} --completion-bash ${COMP_WORDS[@]:1:$COMP_CWORD} )
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _newt_bash_autocomplete newt

[ -s "/Users/spadin/.bun/_bun" ] && source "/Users/spadin/.bun/_bun"
