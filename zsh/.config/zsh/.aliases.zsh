
# .aliases
#
# @author Robert MacCracken
#

# Aliases for eza usage
alias ll='eza -lag --icons'
alias l='eza -a --icons'
alias lfiles='eza -F'
alias llfiles='eza -lF'
alias ldir='eza -d */'
alias lldir='eza -ld */'

alias grep="grep --color=auto"
alias hostname="echo $HOST"
alias vim='nvim'

# cat replacement
alias cat="bat $@"

# Generic "tint anything piped to me" — usage: `cmd | rainbow`
# Equivalent to `cmd | anuenue` but composes nicely after a chain.
if command -v anuenue >/dev/null 2>&1; then
  alias rainbow='anueue'
  alias rnbw='anuenue'
fi

# Personal
if type brew &>/dev/null
then
  alias brew-cup="brew update && brew upgrade && brew cleanup"
fi
#alias gorepo="cd $HOME/Repos/go_projects/src/github.com/MacCracken"
