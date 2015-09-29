vectorisepdffont
================

Vectorise fonts of a pdf file.

This script require [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/), [pdf2svg](https://github.com/db9052/pdf2svg), [inkscape](https://www.inkscape.org/), and perl-rename.

Usage: `vectorisepdffont.sh <file.pdf>`

#Installation of dependences
##Gentoo
    sudo emerge app-text/pdftk media-gfx/pdf2svg media-gfx/inkscape dev-perl/rename

##Debian
    sudo aptitude install inkscape pdf2svg pdftk rename
