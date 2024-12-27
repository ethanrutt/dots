# Helpful Command
* I had to reset my `xdg-mime` since it was using ephoto as a pdf viewer by
default when opening a pdf.
* check the output of
```bash
xdg-mime query default application/pdf
```
* and if it's not `mupdf.desktop` then run
```bash
xdg-mime default mupdf.desktop application/pdf
```

