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
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if command -v eza &> /dev/null ; then
    alias ll='eza -alF --icons'
    alias la='eza -A'
    alias l='eza --oneline'
    alias ls='eza'
    alias tree='eza --tree'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls'
fi

if command -v bat &> /dev/null ; then
    alias cat='bat'
fi

if command -v git &> /dev/null ; then
    alias g='git'
    alias gs='git status'
    alias ga='git add'
    alias gau='git add -u'
    alias gap='git add -p'
    alias gcmt='git commit -m'
    alias glg='git log'
    alias gpsh='git push'
    alias gpll='git pull'
    alias gco='git checkout'
    alias gd='git diff'
fi

if command -v tmux &> /dev/null ; then
    # allow tmux to use all 256 colors
    alias tmux='tmux -2'
    alias tls='tmux ls'
fi

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}

