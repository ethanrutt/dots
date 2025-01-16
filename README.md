# Ethan's dots

- heavily inspired from TechDufus's [dotfiles](https://github.com/TechDufus/dotfiles)

## Usage

- This oneliner should completely set up your system (for arch)
- I only really use Ubuntu in WSL and in VM's so Ubuntu will only have my developer command line tools setup, no `awesomewm` or any of the stuff required to run the system like the `pulse`, `rofi`, etc.
- Make sure to have `curl` installed before running this command

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ethanrutt/dots/main/bin/dots)"
```

* This will setup the dots dir in `$HOME/.dots` and it will also add the `bin` folder to your path, allowing you to run this command at any point to sync all dotfiles again with the upstream repository
```sh
dots
```

* To run only a specific role, or pass other flags to the `ansible-playbook` command, just pass them straight into the `dots` binary
* i.e. running only the `nvim` role
```sh
dots -t nvim
```

* note on Ubuntu there is no `delta` in apt so a manual install is required. This is documented and when running the `delta` role a debug message is printed.

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

```sh
ansible-playbook main.yml
```

- run the playbook and install packages too

```sh
ansible-playbook --ask-become-pass main.yml
```

- run only a specific role from the playbook i.e. only the nvim role

```sh
ansible-playbook --ask-become-pass main.yml -t nvim
```

- note that installing this with the oneliner above will not allow you to
easily do development unless you have a personal access token set up, since
everything is cloned with http. If you would like to do development, then you
should clone this manually with an ssh key
