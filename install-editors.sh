#!/usr/bin/env bash

unalias vim &> /dev/null
vim_command=$(command -v vim)
if [ -z $vim_command ]
then
    echo "You need to install vim"
    exit 1
fi

nvim_command=$(command -v nvim)
if [ -z $nvim_command ]
then
    echo "You need to install neovim"
    exit 1
fi

python_command=$(command -v python)
if [ -z $python_command ]
then
    echo "You need to install python (preferably the latest version)"
    echo "Recommend to install pyenv with 'curl https://pyenv.run | bash'"
    exit 1
fi

python -c "import neovim" &> /dev/null
if [ $? -ne 0 ]
then
	echo "You need to install neovim pip package (python 2 and 3)"
    exit 1
fi

echo "Creating symlinks"
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc

NVIM_DIR=$HOME/.config/nvim/
rm -rf $NVIM_DIR
mkdir $NVIM_DIR

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/nvim/init.vim $NVIM_DIR/init.vim

vim +PlugInstall +qall
nvim +PlugInstall +qall
