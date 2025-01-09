#
# .functions.zsh
#
# @author Robert MacCracken
#

# Banner Setup
function banner {
  echo
  figlet -w $(tput cols) -c -f modular -d ~/.figlet/fonts $@ | lolcat
  echo
}

function hostbanner {
  banner $(hostname | sed 's/\.local$//')
}

function clr {
  clear
  hostbanner
}

# fd - cd to selected directory
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
function fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

function repos() {
  home="$HOME/Repos"
  local dir
  if [ -z "$1" ]; then
    cd $home
  else
    dir=$(find $home -type d -name "$1" -print0 -maxdepth 5)
    [[ -n "$dir" ]] && cd "$dir"
  fi
}
