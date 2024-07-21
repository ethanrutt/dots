#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d  ~/.config/bash ]; then
    for file in ~/.config/bash/*.sh; do
      source "$file"
    done
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

