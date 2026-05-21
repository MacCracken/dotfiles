# Local Bin
export PATH="$HOME/.local/bin:$PATH"

# Cyrius
export PATH="$HOME/.cyrius/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

eval "$(starship init zsh)"

# Include .setup file (if present) containing source files
# for zsh syntax highlighting and autosuggestions
if [ -f ~/.config/zsh/.setup.zsh ]
then
  source ~/.config/zsh/.setup.zsh
fi

source ~/.ssh/.api_keys

# fastfetch — paused; will hard-replace with first-party tool.
#fastfetch

bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# ─── Sibling-tool dogfood ────────────────────────────────────
# BannerManor Test
bnrmr "$(hostname | sed 's/\.local$//')"

# iam — M5 dogfood (one release cycle, ~v0.5.0 → v0.9.0).
# Per-interactive-shell, not just login: max exposure to spot
# regressions / annoyances. Remove or move to ~/.zlogin if noisy.
command -v iam >/dev/null && iam

# commandress — paused; precmd hook reserved for re-enable.
#setopt prompt_subst
#_cmdrs_precmd() {
#    export AGNOSHI_LAST_EXIT=$?
#    PROMPT="$(cmdrs)"
#}
#precmd_functions+=(_cmdrs_precmd)
