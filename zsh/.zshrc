eval "$(starship init zsh)"

# Include functions file (if present) containing functions for zsh banner, etc.
if [ -f ~/.config/zsh/functions.zsh ]
then 
  source ~/.functions.zsh
  # Show Banner
  hostbanner
  neofetch
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zstyle :compinstall filename '/home/macro/.zshrc'
autoload -Uz compinit
compinit

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.config/zsh/.aliases ], then source ~/.config/zsh/.aliases; fi

# Include .env_vars file (if present) containing env vars for ssh, etc.
if [ -f ~/.config/zsh/.env_vars ], then source ~/.config/zsh/.env_vars; fi
