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

# Show Banner
hostbanner