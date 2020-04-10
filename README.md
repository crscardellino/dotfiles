# Dotfiles

## Main Installation

Need to install `zsh`, `vim`, `python`, and a good terminal emulator (iTerm2
for OSX and xfce4-terminal for linux are good options).

For `zsh` and `vim` go with the official repository version for linux (should
be available in most if not all linux distros) and go for
[`homebrew`](https://brew.sh/) version on OSX.

For Python I highly recommend managing everything through
[`pyenv`](https://github.com/pyenv/pyenv) (in the case for OSX it can be
installed via `homebrew`, for linux check the instructions and also see
[`pyenv installer`](https://github.com/pyenv/pyenv-installer)).

I recommend you to set up a global `pyenv` of python >= 3.6, make sure it's
in the `$PATH` before running the installation script:

    $ bash install.sh

After it finishes close and open the terminal and run the command (or
whatever color scheme you desire):

    $ base16_twilight

There are 2 things to take into consideration here:

1. The color combination will work or not depending on the setup of the
   terminal emulator, thus check it can support all the needed colors.
2. You need to install (and activate in the emulator) the
   [Powerline Fonts](https://github.com/powerline/fonts)

## Neovim

To install neovim dotfiles, first you need to install `neovim` and `curl`
packages (once again go for the repository of your choice), also, having
`pyenv` correctly activated and in `$PATH` (check the details on how to
correctly initialize `pyenv` in your `.zshrc` file) you need to install the
python neovim library (careful, this should probably be installed on each of
the python environments you use):

    $ pip install neovim
    $ bash install-neovim.sh

## TMUX

For tmux you need to first install your `tmux` from your repository of choice:

    $ bash install-tmux.sh

If you want to activate sessions, check the session sample file (and modify
the `.tmux.conf` file accordingly).

## Other dotfiles

The `.zshrc_extras` dotfile is useful to add machine specific configurations to your
`.zshrc` file. There's a sample `.zshrc_extras` file with some useful stuff.

For the case of `Visual Studio Code`, you need to manually make a link to the
`settings.json` and `keybindings.json` files in this directory to the location
of the original files of `VSCode` (it can vary from OSX to Linux).
