#!/usr/bin/env bash

echo "Installing new plugins for vim"
vim +PluginInstall +Q

echo "Updating vim plugins"
vim +PluginUpdate +Q
