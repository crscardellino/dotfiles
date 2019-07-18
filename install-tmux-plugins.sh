#!/usr/bin/env bash

tmux_command=$(command -v tmux)
if [ -z $tmux_command ]
then
    echo "You need to install tmux"
    exit 1
fi

rm -rf ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -f $HOME/.tmux.conf
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

echo "You should create the start sessions (base on session-sample.tmux)"
