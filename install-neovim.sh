#!/usr/bin/env bash

nvim_command=$(command -v nvim)
if [ -z $nvim_command ]
then
    echo "You need to install nvim"
    exit 1
fi

python_command=$(command -v python)
if [ -z $python_command ]
then
    echo "You need to install python"
    exit 1
fi

python -c "import neovim" &> /dev/null
if [ $? -ne 0 ]
then
    echo "You need to install neovim pip package"
    exit 1
fi

NVIM_DIR=$HOME/.config/nvim/
NVIM_BUNDLE_DIR=$NVIM_DIR/bundle
 
echo "Creating directories"
rm -rf $NVIM_DIR
mkdir -p $NVIM_BUNDLE_DIR
 
echo "Downloading install script"
wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -O dein_installer.sh

echo "Running install script"
bash ./dein_installer.sh $NVIM_BUNDLE_DIR
rm -f ./dein_installer.sh

echo "Creating symlinks"
ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
nvim '+call dein#install()'
