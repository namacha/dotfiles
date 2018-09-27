#!/bin/sh
mkdir $HOME/.vim-backup
cd `dirname $0`
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
	cp -r $dotfile $HOME
    fi
done
