#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d  ~/.config/bash ]; then
    for file in ~/.config/bash/*.sh; do
      source "$file"
    done
fi

