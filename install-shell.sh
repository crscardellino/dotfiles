#!/usr/bin/env bash

zsh_command=$(command -v zsh)

if [ -z $zsh_command ]
then
    echo "You need to install zsh"
    exit 1
fi

echo "Creating symlinks"
for file in gitconfig zshrc condarc p10k.zsh
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
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"

echo "Installing oh-my-zsh with plugins"
rm -rf $HOME/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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

echo "Finished the installation"
echo
echo "RESTART THE CONSOLE SESSION AND RUN base16_twilight"
