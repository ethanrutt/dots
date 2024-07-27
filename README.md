# Ethan's dots

- heavily inspired from TechDufus's [dotfiles](https://github.com/TechDufus/dotfiles)

## Usage

- This oneliner should completely set up your system (for arch)
- I only really use Ubuntu in WSL so that's all Ubuntu will be setup for

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ethanrutt/dots/main/bin/dots)"
```

## Dev Commands

- get ansible with pip

```sh
pip install ansible
```

- get ansible with package manager

```sh
sudo pacman -S ansible
```

- run the playbook (prob won't work since you likely need sudo to install packages)

```
ansible-playbook main.yml
```

- run the playbook and install packages too

```
ansible-playbook --ask-become-pass main.yml
```

### TODO

- figure out vault for ssh keys?

- stuff for python development
    - ruff-lsp
    - pyright
- stuff for react development
    - tsserver
    - html-lsp
    - css-lsp
