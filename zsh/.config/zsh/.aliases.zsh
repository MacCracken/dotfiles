
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

# Personal
if type brew &>/dev/null
then
  alias brew-cup="brew update && brew upgrade && brew cleanup"
fi
#alias gorepo="cd $HOME/Repos/go_projects/src/github.com/MacCracken"
