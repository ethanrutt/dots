################################################################################
# fzf
################################################################################
[ -d "$HOME/.fzf" ] && export PATH="$PATH:$HOME/.fzf/bin"

# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
eval "$(fzf --bash)"

################################################################################
# dots
################################################################################
[ -d "$HOME/.dots" ] && export PATH="$PATH:$HOME/.dots/bin"

################################################################################
# nvm
################################################################################
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

################################################################################
# bat
################################################################################
[ -d "$HOME/.config/bat/themes" ] && export BAT_THEME="Catppuccin-Mocha"
if command -v bat &> /dev/null ; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi
