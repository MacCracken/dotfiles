#
# .setup
#
# @author Robert MacCracken
#

# Activate syntax highlighting
if type brew &>/dev/null
then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES})) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
if type brew &>/dev/null
then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Additional completitions
if type brew &>/dev/null
then
  source $(brew --prefix)/share/zsh/site-functions
else
  source /usr/share/zsh/site-functions
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Include .env_vars file (if present) containing env vars.
if [ -f ~/.config/zsh/.env_vars.zsh ]
then
  source ~/.config/zsh/.env_vars.zsh
fi

# Include alias file (if present) containing aliases.
if [ -f ~/.config/zsh/.aliases.zsh ]
then 
  source ~/.config/zsh/.aliases.zsh
fi

# Include functions file (if present) containing functions for zsh banner, etc.
if [ -f ~/.config/zsh/.functions.zsh ]
then 
  source ~/.config/zsh/.functions.zsh
  # Show Banner
  hostbanner
fi
