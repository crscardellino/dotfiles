# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ `tput colors` != "256" ] || [ "$TERM_PROGRAM" = "vscode" ]
then
  ZSH_THEME="mh"
  export TERM="xterm-color"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# User configuration
source $ZSH/oh-my-zsh.sh

# Color for zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=24'

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Aliases
if [ `uname` = "Darwin" ]
then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -lh"
alias la="ls -A"
alias l="ls -CF"
alias rm="rm -i"

# no autocorrection
unsetopt correct_all

# to activate wildcards in scp and others
setopt nonomatch

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Extending the PATH

function clear_path() {
    export PATH=$(
        echo $PATH | tr ':' '\n' | nl | sort -k2 | uniq -f 1 | sort -n |
            cut -f 2 | tr '\n' ':' | sed -e 's/\:$//'
        )
}

export USR_LOCAL=/usr/local
export PATH=$USR_LOCAL/bin:$USR_LOCAL/sbin:$PATH
export LOCAL_PATH=$HOME/.local
export PATH=$LOCAL_PATH/bin:$LOCAL_PATH/sbin:$PATH

# History file sizes
export HISTSIZE=500000
export SAVEHIST=500000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Disable virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Extras
if [ -f "$HOME/.zshrc_extras" ]
then
    source "$HOME/.zshrc_extras"
fi

# Base16

## Check if we are in a ssh session

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
  IS_SSH=1
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) IS_SSH=1;;
  esac
fi

## If not in ssh and not root => activate BASE16 (Otherwise can break terminal colors)
if [ -z $IS_SSH ] && [ $EUID -ne 0 ]
then
	BASE16_SHELL=$HOME/.config/base16-shell/
	[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

clear_path
