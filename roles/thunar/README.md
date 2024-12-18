# Helpful Command
* I had to reset my `xdg-mime` since it was using ephoto as a file manager by
default when opening the location of a file in firefox or something similar.
* check the output of
```bash
xdg-mime query default inode/directory
```
* and if it's not `thunar.desktop` then run
```bash
xdg-mime default thunar.desktop inode/directory
```

