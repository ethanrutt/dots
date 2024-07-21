# dir traversal aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto -n'
    alias fgrep='fgrep --color=auto -n'
    alias egrep='egrep --color=auto -n'
fi

if [ -x $(command -v eza) ]; then
    alias ll='eza -alF --icons'
    alias la='eza -A'
    alias l='eza --oneline'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls'
fi

if [ -x $(command -v git) ]; then
    alias gs='git status'
    alias gau='git add -u'
    alias gcmt='git commit -m'
    alias glg='git log'
    alias gpsh='git push'
    alias gpll='git pull'
fi

if [ -x $(command -v tmux) ]; then
    # allow tmux to use all 256 colors
    alias tmux='tmux -2'
    alias tls='tmux ls'
fi

if [ -x $(command -v tmuxster) ]; then
    alias tster='tmuxster'
fi

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}

