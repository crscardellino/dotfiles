#!/usr/bin/env bash

echo "Creating symlinks"
for file in gitconfig vimrc zshrc
do
    dotfile=$PWD/.$file
    link=$HOME/.$file
    rm -f $link
    ln -s $dotfile $link
done

echo "Installing oh-my-zsh"
rm -rf $HOME/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

echo "Creating symlink to zsh theme"
ln -s $PWD/ragnarok.zsh-theme $HOME/.oh-my-zsh/themes

if [ -f $HOME/.bash_history ]
then
    echo "Copying original bash history file to zsh history file"
    cat $HOME/.bash_history | ./bash-zsh-history.py >> $HOME/.zsh_history
fi

echo "Changing shell to zsh"
if [ -f /etc/shells ]
then
    chsh -s /bin/zsh
else
    chsh -s `which zsh`
fi

echo "Installing vim plugins"
rm -rf $HOME/.vim
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Finished the installation"
