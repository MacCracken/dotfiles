#
# .env_vars
#
# @author Robert MacCracken
#
# LOCAL ENVIRONMENT VARS
XDG_CONFIG_HOME="$HOME/.config"
EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"

# History Settings
HISTFILE="$XDG_CONFIG_HOME/zsh/history/.histfile"
HISTSIZE=1000
SAVEHIST=1000

# VAGRANT DISKS beta
# export VAGRANT_EXPERIMENTAL="disks"

# User Local Bins
path+=("$HOME/usr/local/bin")

# Rust Cargo Bin PATH and ENV Vars
path+=("$HOME/.cargo/bin")
if [ -f ~/.cargo/env ]
then
  source ~/.cargo/env
fi

# GOPATH and PATH update
# export GOPATH="$HOME/Repos/go_projects"
# export PATH="$PATH:$GOPATH/bin"

# Ruby PATH
# export PATH="$PATH:/usr/local/sbin"
# export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.0/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/ruby/lib"
# export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Python PATH
# export PATH="$PATH:$HOME/Library/Python/3.11/bin"

# ANDROID
# export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
