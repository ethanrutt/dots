# tmuxster(1)
#
# NAME
#
#   tmuxster - simple tmux session manager and creator
#
# SYNOPSIS
#   tmuxster [-n session_name]
#
# DESCRIPTION
#
#   `tmuxster` is a shell function for creating new `tmux` sessions and
#   attaching to existing `tmux` sessions. See the example for more details on
#   how to use it.
#
# OPTIONS
#
#   -n    new: Will tell tmuxster to create a new tmux session. A name for the
#              session must be specified with this option.
#
# ENVIRONMENT VARIABLES
#
#   TMUXSTER_DEFAULT_DIR
#         If this environment variable is set, then when running with the -n
#         argument, tmuxster will start the search for directories to make the
#         base of your new tmux session at that directory
#
# DEPENDENCIES
#
#   `fzf` must be installed and the `__fzf_cd__` command must be available to
#         run in your shell
#
#    `tmux` must be installed
#
# EXAMPLE
#
#   ```
#   source /path/to/tmuxster.sh
#   # OPTIONAL: export the directory where you would like the search for
#   #           directories to start, normally a projects directory
#   export TMUXSTER_DEFAULT_DIR="/home/user/projects"
#
#   # create a new tmux session called project1. After running this command, a
#   # fzf window will pop up that will list all directories starting either at
#   # TMUXSTER_DEFAULT_DIR if it is set, otherwise the pwd where you ran command
#   # tmuxster -n project1
#
#   # after working for a bit and detaching from the session, create a new
#   # session
#   tmuxster -n project2
#
#   # after working for a bit and detaching, you can then see both sessions and
#   # pick which one you would like to attach to by running
#   tmuxster
#   ```
#
# AUTHOR
#
#   Written by Ethan Rutt.
#
# SEE ALSO
#   tmux
#   fzf

function tmuxster_usage {
    echo "Usage: tmuxster [-n session-name]"
}

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

