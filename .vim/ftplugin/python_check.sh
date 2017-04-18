#!/bin/sh

#required pyflakes ex) pip install pyflakes
pyflakes $1
#required pep8 ex( install pep8
pep8 --show-source $1

