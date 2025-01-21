#
# fzf
#
[ -d "$HOME/.fzf" ] && export PATH="$PATH:$HOME/.fzf/bin"
[ -d "$HOME/.fzf-git" ] && source "$HOME/.fzf-git/fzf-git.sh"

export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#
# dots
#
[ -d "$HOME/.dots" ] && export PATH="$PATH:$HOME/.dots/bin"

#
# nvm
#
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#
# bat
#
[ -d "$HOME/.config/bat/themes" ] && export BAT_THEME="Catppuccin-Mocha"
if command -v bat &> /dev/null ; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi

#
# fzf integration
#
if command -v bat &>/dev/null && command -v fzf &>/dev/null && command -v eza &> /dev/null && command -v fd &> /dev/null ; then
    # preview is bat if it's a file, eza tree otherwise
    export FZF_CTRL_T_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'if [[ -f {} ]] ; then bat -n --color=always --line-range=:500 {} ; else eza --color=always --tree --level=1 {} ; fi'
      --bind 'ctrl-/:change-preview-window(down|hidden|)'"

    export FZF_ALT_C_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'eza --color=always --tree --level=1 {}'"

    export FZF_DEFAULT_COMMAND="fd --follow --hidden --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type directory --follow --hidden --exclude .git"

    _fzf_compgen_path() {
      fd --follow --hidden --exclude ".git" . "$1"
    }

    _fzf_compgen_dir() {
      fd --type directory --follow --hidden --exclude ".git" . "$1"
    }
fi

