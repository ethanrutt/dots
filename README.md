# Ethan's dots

- heavily inspired from TechDufus's [dotfiles](https://github.com/TechDufus/dotfiles)

## Usage

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

- get bash script setup to get this playbook and run it

- test on vms

- figure out vault for ssh keys?
