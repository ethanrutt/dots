if [ -x $(command -v fzf) ]; then
    # Set up fzf key bindings and fuzzy completion
    export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
    eval "$(fzf --bash)"
fi

