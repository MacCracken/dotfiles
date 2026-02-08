eval "$(starship init zsh)"

# Include .setup file (if present) containing source files 
# for zsh syntax highlighting and autosuggestions
if [ -f ~/.config/zsh/.setup.zsh ]
then
  source ~/.config/zsh/.setup.zsh
fi

source ~/.ssh/.api_keys

fastfetch

bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
# opencode
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"

