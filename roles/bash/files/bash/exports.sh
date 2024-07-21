################################################################################
# fzf
################################################################################

if [[ ! "$PATH" == "*$HOME/.fzf/bin*" ]]; then
    export PATH="$PATH:$HOME/.fzf/bin"
fi

if command -v fzf &> /dev/null ; then
    # Set up fzf key bindings and fuzzy completion
    export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
    eval "$(fzf --bash)"
fi

################################################################################
# dots
################################################################################

if [ -d ~/.dots ]; then
    export PATH="$PATH:$HOME/.dots/bin"
fi

################################################################################
# nvm
################################################################################
if [ -d ~/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

