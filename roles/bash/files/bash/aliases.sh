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

# some more ls aliases
alias ll='eza -alF --icons'
alias la='eza -A'
alias l='eza --oneline'

# dir traversal aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# git aliases
alias gs='git status'
alias gau='git add -u'
alias gcmt='git commit -m'
alias glg='git log'
alias gpsh='git push'
alias gpll='git pull'

# allow tmux to use all 256 colors
alias tmux='tmux -2'
alias tls='tmux ls'
alias tster='tmuxster'

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}


