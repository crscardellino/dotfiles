#!/usr/bin/env bash

zsh_command=$(command -v zsh)

if [ -z $zsh_command ]
then
    echo "You need to install zsh"
    exit 1
fi

vim_command=$(command -v vim)
if [ -z $vim_command ]
then
    echo "You need to install vim"
    exit 1
fi

python_command=$(command -v python)
if [ -z $python_command ]
then
    echo "You need to install python"
    exit 1
fi

echo "Creating symlinks"
for file in gitconfig vimrc zshrc tmux.conf condarc
do
    dotfile=$PWD/.$file
    link=$HOME/.$file
    rm -f $link
    ln -s $dotfile $link
done

echo "Installing Base16 theme"
rm -rf $HOME/.config/base16-shell
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

echo "Installing oh-my-zsh with plugins"
rm -rf $HOME/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

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
echo "Restart the console session and run base16_solarized-dark"
