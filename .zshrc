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

# Show Banner
hostbanner
neofetch

# LOCAL ENVIRONMENT VARS
# VAGRANT DISKS beta
export VAGRANT_EXPERIMENTAL="disks"

# ZSH home folder
export ZSH="$HOME/.oh-my-zsh"

# GOPATH and PATH update
export GOPATH="$HOME/Repos/go_projects"
export PATH="$PATH:$GOPATH/bin"

# Ruby PATH
export PATH="$PATH:/usr/local/sbin"
# export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.0/bin:$PATH"
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

#ZSH Plugins
plugins=(aliases git tmux) #aws azure rust golang docker-compose docker kubectl kubectlx vagrant vagrant-prompt teraform

# Ohmyzsh Source
source $ZSH/oh-my-zsh.sh

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
