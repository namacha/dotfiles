#!/bin/sh
mkdir $HOME/.vim-backup
cd `dirname $0`
for dotfiles in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfiles" $HOME
    fi
done
