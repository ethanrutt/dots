# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias grep='grep -n'
    alias egrep='egrep -n'
    alias fgrep='fgrep -n'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}

# tmuxster and sf commands
if [ -f ~/.tmuxster.bash ]; then
    source ~/.tmuxster.bash
    alias tster='tmuxster'
fi

