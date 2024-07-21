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

if command -v eza &> /dev/null ; then
    alias ll='eza -alF --icons'
    alias la='eza -A'
    alias l='eza --oneline'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls'
fi

if command -v git &> /dev/null ; then
    alias gs='git status'
    alias gau='git add -u'
    alias gcmt='git commit -m'
    alias glg='git log'
    alias gpsh='git push'
    alias gpll='git pull'
fi

if command -v tmux &> /dev/null ; then
    # allow tmux to use all 256 colors
    alias tmux='tmux -2'
    alias tls='tmux ls'
    # alias tster defined in tmuxster.sh
fi

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}

# search and cd into directory with fzf
function sf {
    dir=$(find -L . -path '*/.*' -prune -o -not -name '.*' -type d -print | cut -b3- | fzf)

    if [ -z "${dir}" ] ; then
        return
    fi

    cd "${dir}"
}

function tmuxster_usage {
    echo "Usage: tmuxster [-n session-name]"
}

# function for creating new and attaching to existing tmux sessions
# if ran dry with no args, then you fuzzy find through existing tmux sessions
# and attach to the one you want
#
# if ran with -n argument, then it fuzzy finds to the directory you want
# then creates a new tmux session with that name given to -n argument
function tmuxster {
    local OPTIND session_name opt

    while getopts ":n:" opt; do
        case "${opt}" in
            n)
                session_name="${OPTARG}"
                ;;
            \?)
                echo "Invalid option: -${OPTARG}"
                tmuxster_usage
                return
                ;;
            :)
                echo "Option -${OPTARG} requires an argument"
                tmuxster_usage
                return
                ;;
            *)
                tmuxster_usage
                return
                ;;
        esac
    done

    if [ -z "${session_name}" ]; then
        attach_session=$(tmux ls | fzf | awk -F ': ' '{print $1}')
        tmux a -t "${attach_session}"
    else
        sf
        tmux new -s "${session_name}"
    fi
}

alias tster="tmuxster"

