# Local Bin
export PATH="$HOME/.local/bin:$PATH"

# Cyrius
export PATH="$HOME/.cyrius/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

if [ -f ~/.commandress ]
then
  setopt prompt_subst
  _cmdrs_precmd() {
    export AGNOSHI_LAST_EXIT=$?
    PROMPT="$(cmdrs)"
  }
  precmd_functions+=(_cmdrs_precmd)
else
  eval "$(starship init zsh)"
fi

# Include .setup file (if present) containing source files
# for zsh syntax highlighting and autosuggestions
if [ -f ~/.config/zsh/.setup.zsh ]
then
  source ~/.config/zsh/.setup.zsh
fi

source ~/.ssh/.api_keys

if type brew &>/dev/null
then
  fastfetch
else
  command -v iam >/dev/null && iam
fi

bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
