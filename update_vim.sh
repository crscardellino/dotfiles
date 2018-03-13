#!/usr/bin/env bash

unalias vim &> /dev/null

echo "Installing new plugins for vim"
vim +PluginInstall +Q

echo "Updating vim plugins"
vim +PluginUpdate +Q
