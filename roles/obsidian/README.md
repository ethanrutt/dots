# Adding notes
* By default this is cloned with https, and since I don't have personal access tokens setup, this means you cannot push code
* One way to get around this is to first set ssh keys up (which you should do on a new machine anyway) then change the upstream in the config file
* Since this is submoduled, looking in `obsidian_vaults/.git` just shows a path to the actual `.git` for this submodule, which is in the top level `.git`
* Once you've found the `obsidian_vaults/config` in the top level `.git` folder, you can change the following
```
[remote "origin"]
    url = https://github.com/ethanrutt/obsidian_vaults.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```
* to the following
```
[remote "origin"]
	url = git@github.com:ethanrutt/obsidian_vaults.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```
* now you should be able to push given you've properly setup ssh keys
