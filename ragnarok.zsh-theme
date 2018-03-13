ZSH_THEME_GIT_PROMPT_PREFIX="%K{cyan}%B%F{232} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %f%b%k%F{cyan}"$'\ue0b0'"%f%b%k"
ZSH_THEME_GIT_PROMPT_DIRTY=" "$'\u2739'
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

prompt_datetime() {
  echo -n "%K{23}%F{232} %D{%a %b %d}  %K{15}%F{23}"$'\ue0b0'"%f%k"
  echo -n "%K{15}%F{232} %T  %K{16}%F{15}"$'\ue0b0'"%f%k"
}

prompt_current() {
  echo -n "%K{16}%F{232} tty:%l  %K{blue}%F{16}"$'\ue0b0'"%f%k"
  echo -n "%K{blue}%F{232} %~  %f%k"
}

prompt_git() {
  git_info=$(git_prompt_info)
  if [ "$git_info" = "" ]
  then
    echo "%F{blue}"$'\ue0b0'"%f%k"
  else
    echo -n "%K{cyan}%F{blue}"$'\ue0b0'"%f%k"
    echo $git_info
  fi
}

prompt_context() {
  echo -n "%K{24}%F{21} %n %K{88}%F{24}"$'\ue0b0'
  echo -n "%K{88}%B%F{white} %m %f%b%k%K{yellow}%F{88}"$'\ue0b0'"%f%k"
  echo -n "%K{yellow}%F{232} %c "

  _conda_path=$CONDA_ENV_PATH$CONDA_PREFIX
  if ! [ -z "$_conda_path" ]
  then
    echo -n "%B%F{white}(conda: $(basename $_conda_path)) %f%b"
  elif ! [ -z $VIRTUAL_ENV ]
  then
    echo -n "%B%F{white}(venv: $(basename $VIRTUAL_ENV)) %f%b"
  fi

  if [ $RETVALUE -eq 0 ]
  then
    echo -n "%K{green}%F{yellow}"$'\ue0b0'"%f%k"
    echo -n "%K{green}%B%F{white} "$'\u2713'" %f%b%k%F{green}"$'\ue0b0'
  else
    echo -n "%K{red}%F{yellow}"$'\ue0b0'"%f%k"
    echo -n "%K{red}%B%F{white} "$'\u2717'" %f%b%k%F{red}"$'\ue0b0'
  fi
}

## Main prompt
build_prompt() {
  RETVALUE=$?
  prompt_datetime
  prompt_current
  prompt_git
  prompt_context
}

PROMPT='$(build_prompt) '
