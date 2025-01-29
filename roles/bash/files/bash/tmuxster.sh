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
#   `fzf` must be installed and the available to run in your shell
#
#   `tmux` must be installed and available to run in your shell
#
#   `awk` must be installed and available to run in your shell
#
#   `fd` or `find` must be installed and available to run in your shell. `fd`
#         will be prioritized
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
#   tmuxster -n project1
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
#   awk
#   find
#   fd

function tmuxster_usage {
    echo "Usage: tmuxster [-n session-name]" >&2
}

function tmuxster {
    local OPTIND session_name opt use_fd sessions attach_session session_directory

    if ! command -v fzf &> /dev/null ; then
        echo "Error: fzf not available" >&2
        return 1
    fi

    if ! command -v tmux &> /dev/null ; then
        echo "Error: tmux not available" >&2
        return 1
    fi

    if ! command -v awk &> /dev/null ; then
        echo "Error: awk not available" >&2
        return 1
    fi

    if ! command -v fd &> /dev/null ; then
        use_fd=true
    else
        if ! command -v find &> /dev/null ; then
            echo "Error: both fd and find not available" >&2
            return 1
        fi
        use_fd=false
    fi

    while getopts ":n:" opt; do
        case "${opt}" in
            n)
                session_name="${OPTARG}"
                ;;
            \?)
                echo "Invalid option: -${OPTARG}" >&2
                tmuxster_usage
                return
                ;;
            :)
                echo "Option -${OPTARG} requires an argument" >&2
                tmuxster_usage
                return
                ;;
            *)
                tmuxster_usage
                return
                ;;
        esac
    done

    if [[ -z "$session_name" ]]; then
        sessions="$(tmux ls 2> /dev/null)"

        if [[ $? -ne 0 ]]; then
            echo "Error: no tmux sessions exist" >&2
            return 1
        fi

        attach_session=$(echo "$sessions" | fzf | awk -F ': ' '{print $1}')

        if [[ -z "${attach_session}" ]]; then
            echo "Error: couldn't find session" >&2
            return 1
        fi

        tmux a -t "${attach_session}"
    else
        if [[ $use_fd ]]; then
            if [[ ! -z "$TMUXSTER_DEFAULT_DIR" ]]; then
                session_directory="$(cd "$TMUXSTER_DEFAULT_DIR" &>/dev/null && fd -d 1 | fzf)"
            else
                session_directory="$(fd | fzf)"
            fi
        else
            if [[ ! -z "$TMUXSTER_DEFAULT_DIR" ]]; then
                session_directory="$(find $TMUXSTER_DEFAULT_DIR | fzf)"
            else
                session_directory="$(find . | fzf)"
            fi
        fi

        if [[ -z "$session_directory" ]]; then
            echo "Error: couldn't find new session directory" >&2
            return 1
        fi

        tmux new -s "$session_name" -c "$session_directory"
    fi
}

export TMUXSTER_DEFAULT_DIR="/home/ethanrutt/projects"

alias tster="tmuxster"

