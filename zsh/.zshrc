eval "$(starship init zsh)"

# Include .setup file (if present) containing source files 
# for zsh syntax highlighting and autosuggestions
if [ -f ~/.config/zsh/.setup ]
then
  source ~/.config/zsh/.setup
fi

# Include .env_vars file (if present) containing env vars.
if [ -f ~/.config/zsh/.env_vars ]
then
  source ~/.config/zsh/.env_vars
fi

# Include alias file (if present) containing aliases.
if [ -f ~/.config/zsh/.aliases ]
then 
  source ~/.config/zsh/.aliases
fi

# Include functions file (if present) containing functions for zsh banner, etc.
if [ -f ~/.config/zsh/.functions.zsh ]
then 
  source ~/.config/zsh/.functions.zsh
  # Show Banner
  hostbanner
fi

fastfetch

bindkey -v
zstyle :compinstall filename '/home/macro/.zshrc'
autoload -Uz compinit
compinit

