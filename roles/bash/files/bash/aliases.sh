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
    # alias tster defined in tmuxster.sh
fi

alias q='exit'

# ls on cd
function cd {
    builtin cd "$@" && ll
}

#
# tmuxster
#
function tmuxster_usage {
    echo "Usage: tmuxster [-n session-name]"
}

# function for creating new and attaching to existing tmux sessions
# if ran dry with no args, then you fuzzy find through existing tmux sessions
# and attach to the one you want
#
# if ran with -n argument, then it fuzzy finds to the directory you want
# then creates a new tmux session with that name given to -n argument
#
# if the env variable TMUXSTER_DEFAULT_DIR is set, then when running with the
# -n argument, tmuxster will start the search for directories at that directory
#
# fzf must be installed and the `__fzf_cd__` command must be available to run in
# your shell
# tmux must be installed
#
# example usage
# ```
# export TMUXSTER_DEFAULT_DIR="/home/user/projects"
# tmuxster -n project1
# # then pick the directory you want, probably project1 in the projects folder
# # after working for a bit and detaching from the session, create a new session
# tmuxster -n project2
# # after working for a bit and detaching, you can then see both sessions with
# tmuxster
# ```
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

    if [[ -z "${session_name}" ]]; then
        tmux ls &> /dev/null && {
            attach_session=$(tmux ls | fzf | awk -F ': ' '{print $1}')
        } || {
            echo "no tmux sessions exist"
            return
        }

        if [[ ! -z "${attach_session}" ]]; then
            tmux a -t "${attach_session}"
        fi
    else
        if [[ ! -z "$TMUXSTER_DEFAULT_DIR" ]]; then
            cd "$TMUXSTER_DEFAULT_DIR" &> /dev/null
        fi

        cd_cmd="$(__fzf_cd__)"

        if [[ ! -z "$cd_cmd" ]]; then
            eval "$cd_cmd"
            tmux new -s "${session_name}"
        else
            echo "cd to the specified directory was interrupted or failed"
        fi
    fi
}

export TMUXSTER_DEFAULT_DIR="/home/ethanrutt/projects"

alias tster="tmuxster"

