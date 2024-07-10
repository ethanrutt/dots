#!/usr/bin/env bash

install_deps() {
    distro=$1
    case $distro in
        ubuntu|debian)
            sudo apt update
            sudo apt install -y tmux
            sudo apt install -y bat
            sudo apt install -y exa
            sudo apt install -y fzf
            ;;
        fedora)
            sudo dnf install -y tmux
            sudo dnf install -y bat
            sudo dnf install -y exa
            sudo dnf install -y fzf
            ;;
        centos|rhel)
            sudo yum install -y epel-release
            sudo yum install -y tmux
            sudo yum install -y bat
            sudo yum install -y exa
            sudo yum install -y fzf
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm tmux
            sudo pacman -S --noconfirm bat
            sudo pacman -S --noconfirm exa
            sudo pacman -S --noconfirm fzf
            ;;
        opensuse)
            sudo zypper install -y tmux
            sudo zypper install -y bat
            sudo zypper install -y exa
            sudo zypper install -y fzf
            ;;
        *)
            echo "Unsupported distribution: $distro"
            exit 1
            ;;
    esac
}

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$(echo $ID | tr '[:upper:]' '[:lower:]')
    install_deps "$distro"
else
    echo "can't find distribution"
    exit 1
fi
