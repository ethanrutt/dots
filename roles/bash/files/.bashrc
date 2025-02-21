# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# turn off stty so that C-s doesn't mess up terminal
stty -ixon

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function get_git_branch {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ {\1} /p'
}

# look at else for the prompt without colors, it's more readable
if [ "$color_prompt" = yes ]; then
  PS1='[\[\033[38;5;153m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\033[32m$(get_git_branch)\033[0m\n\$ '
else
  PS1='[\u@\h:\w]$(get_git_branch)\n\$ '
fi

export PATH="$PATH:/home/ethanrutt/.local/bin"

for file in ~/.config/bash/*.sh; do
  source "$file"
done

