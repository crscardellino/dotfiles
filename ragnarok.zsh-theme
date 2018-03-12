ZSH_THEME_GIT_PROMPT_PREFIX="%{$bg[magenta]%}%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}%{$fg_no_bold[magenta]%}"$'\ue0b0'"%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" "$'\u2739'
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

prompt_datetime() {
  echo -n "%{$bg[blue]%}%{$fg[black]%} %D{%a %b %d}  %{$bg[white]%}%{$fg[blue]%}"$'\ue0b0'"%{$reset_color%}"
  echo -n "%{$bg[white]%}%{$fg[black]%} %T  %{$bg[yellow]%}%{$fg[white]%}"$'\ue0b0'"%{$reset_color%}"
}

prompt_current() {
  echo -n "%{$bg[yellow]%}%{$fg[black]%} %d  %{$reset_color%}"
}

prompt_git() {
  git_info=$(git_prompt_info)
  if [ "$git_info" = "" ]
  then
    echo "%{$fg[yellow]%}"$'\ue0b0'"%{$reset_color%}"
  else
    echo -n "%{$bg[magenta]%}%{$fg[yellow]%}"$'\ue0b0'"%{$reset_color%}"
    echo $git_info
  fi
}

prompt_context() {
  echo -n "%{$bg[cyan]%}%{$fg[black]%} %n %{$bg[red]%}%{$fg[cyan]%}"$'\ue0b0'
  echo -n "%{$bg[red]%}%{$fg_bold[white]%} %m %{$reset_color%}%{$bg[yellow]%}%{$fg[red]%}"$'\ue0b0'"%{$reset_color%}"
  echo -n "%{$bg[yellow]%}%{$fg[black]%} %c "

  _conda_path=$CONDA_ENV_PATH$CONDA_PREFIX
  if ! [ -z "$_conda_path" ]
  then
    echo -n "%{$fg_bold[white]%}(conda: $(basename $_conda_path)) %{$reset_color%}"
  elif ! [ -z $VIRTUAL_ENV ]
  then
    echo -n "%{$fg_bold[white]%}(venv: $(basename $VIRTUAL_ENV)) %{$reset_color%}"
  fi

  if [ $RETVALUE -eq 0 ]
  then
    echo -n "%{$bg[green]%}%{$fg[yellow]%}"$'\ue0b0'"%{$reset_color%}"
    echo -n "%{$bg[green]%}%{$fg_bold[white]%} "$'\u2713'" %{$reset_color%}%{$fg[green]%}"$'\ue0b0'
  else
    echo -n "%{$bg[red]%}%{$fg[yellow]%}"$'\ue0b0'"%{$reset_color%}"
    echo -n "%{$bg[red]%}%{$fg_bold[white]%} "$'\u2717'" %{$reset_color%}%{$fg[red]%}"$'\ue0b0'
  fi
}

# prompt_virtualenv() {
#   [[ -n $VIRTUAL_ENV && -n $VIRTUAL_ENV_DISABLE_PROMPT ]] && echo -n "(%{$fg[red]%}"`basename $VIRTUAL_ENV`"%{$reset_color%})"
# }

## Main prompt
build_prompt() {
  RETVALUE=$?
  prompt_datetime
  prompt_current
  prompt_git
  prompt_context
}

PROMPT='$(build_prompt) '
