#!/bin/bash
ln -s .vim ~/vimfiles
ln -s .vimrc ~/vimfiles/_vimrc
vim -c ":PlugInstall|qa"
