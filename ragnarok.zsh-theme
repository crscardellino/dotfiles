ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_no_bold[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

prompt_datetime() {
  echo -n "%{$fg[blue]%}%D{%a %b %d}%{$reset_color%} %{$fg[white]%}%T%{$reset_color%} "
}

prompt_current() {
  echo -n "%{$fg[green]%}tty%l%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%} "
}

prompt_context() {
  echo -n "[%{$fg[cyan]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%}: %{$fg[yellow]%}%c%{$reset_color%}]"
}

prompt_end() {
  if [ $UID -eq 0 ]; then echo -n "#"; else echo -n "$"; fi
}

prompt_virtualenv() {
  [[ -n $VIRTUAL_ENV && -n $VIRTUAL_ENV_DISABLE_PROMPT ]] && echo -n "(%{$fg[red]%}"`basename $VIRTUAL_ENV`"%{$reset_color%})"
}

prompt_git() {
  git_info=$(git_prompt_info)
  if [ -n $git_info ]; then echo $git_info; else echo ""; fi
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_datetime
  prompt_current
  prompt_git
  prompt_virtualenv
  prompt_context
  prompt_end 
}

PROMPT='$(build_prompt) '
