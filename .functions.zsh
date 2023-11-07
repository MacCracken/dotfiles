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

function macbanner {
    banner MACTOP
}

function clr {
  clear
  macbanner
}

# Show Banner
macbanner