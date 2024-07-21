if command -v fzf &> /dev/null ; then
    # Set up fzf key bindings and fuzzy completion
    export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
    eval "$(fzf --bash)"
fi

