#!/bin/usr/env bash

NVIM_DIR=$HOME/.config/nvim/dein

mkdir -p $NVIM_DIR

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.local/installer.sh
bash $HOME/.local/installer.sh $NVIM_DIR

ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
