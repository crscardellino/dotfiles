# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ragnarok"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Disable virtual env prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# LS colors
export LSCOLORS="exfxcxdxbxegedabagacad"

# Aliases
alias ls="ls -G"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -lh"
alias la="ls -A"
alias l="ls -CF"
alias rm="rm -i"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Extending the path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/bin:$HOME/opt:$PATH

# History file sizes
export HISTSIZE=500000
export SAVEHIST=500000

# Ignore DS_Store files
export FIGNORE=DS_Store

# Setting environment variables for working with virtualenv
if [ -d $HOME/.virtualenvs ]
then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=`which python`
    source /usr/local/bin/virtualenvwrapper.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
fi

# perlbrew
[[ -d $HOME/perl5/perlbrew/ ]] && source $HOME/perl5/perlbrew/etc/bashrc

# npm root
[[ -d /usr/local/lib/node_modules ]] && export NODE_PATH=/usr/local/lib/node_modules

# Torch
[[ -d $HOME/torch/ ]] && source $HOME/torch/install/bin/torch-activate

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

