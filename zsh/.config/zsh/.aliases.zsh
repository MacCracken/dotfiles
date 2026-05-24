
# .aliases
#
# @author Robert MacCracken
#

# Aliases for darshini (eza-equivalent in Cyrius; first-party AGNOS).
# darshini default: shows hidden, icons on TTY, multi-column on TTY,
# pipe → plain single-column. `-a`-equivalent semantics already
# implicit, so no flag needed for hidden inclusion.
# Full eza retirement at v1.1.1 (multi-path argv).
alias ll='darshini -l --git'
alias l='darshini'
alias lfiles='darshini -F'
alias llfiles='darshini -lF --git'
alias ldir='darshini -d */'
alias lldir='darshini -ld */'

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
