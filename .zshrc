#
# .zshrc
#
# @author Robert MacCracken
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Include functions file (if present) containing functions for zsh banner, etc.
if [ -f ~/.functions.zsh ]
then
  source ~/.functions.zsh
fi

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# LOCAL ENVIRONMENT VARS
# VAGRANT DISKS beta
export VAGRANT_EXPERIMENTAL="disks"
# ZSH home folder
export ZSH="$HOME/.oh-my-zsh"

# GOPATH and PATH update
export GOPATH="$HOME/Repos/go_projects"
export PATH="$PATH:$GOPATH/bin"

# Ruby PATH
#export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/opt/ruby/bin"
export PATH="$PATH:/usr/local/lib/ruby/gems/3.2.0/bin"
# export LDFLAGS="-L/usr/local/opt/ruby/lib"
# export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Python PATH
export PATH="$PATH:$HOME/Library/Python/3.11/bin"

# ANDROID
# export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# oh-my-zsh settings
# ZSH THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# update automatically without asking
zstyle ':omz:update' mode auto

# Which plugins would you like to load?
plugins=(
  brew
  docker
  git
  golang
  kubectl
  python
  ruby
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable ColorLS to add some color to the command promt for directory commands
source $(dirname $(gem which colorls))/tab_complete.sh