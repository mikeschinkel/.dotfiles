#!/bin/bash
#
# Display Git stuff in my prompt
#
# From http://slacy.com/blog/2012/06/supercharge-your-bash-prompt-with-git-status-goodness/
#
# TODO: Change repo to "{org}/{repo}" for origin (fetch)
#
#       git remote -v | grep "(fetch)" | grep "origin"
#
echo "Running .dotfiles/bash/010-prompt.sh..."

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold

reset='\[\e[00m\]'
bold='\[\e[01m\]'
red='\[\e[31m\]'
green='\[\e[32m\]'
orange='\[\e[33m\]'
blue='\[\e[34m\]'
purple='\[\e[35m\]'
cyan='\[\e[36m\]'
gray='\[\e[37m\]'
bright='\[\e[39m\]'

function dev_prompt {

  repo=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ $? -ne 0 ]; then
    repo=""
    git=0
  else
    repo="${bold}${green}$(basename $repo)$reset"
    git=1
  fi

  if [ $git -ne 0 ]; then
    branch=$(git branch | grep "*" | awk '{print $2}')
    if [ $? -ne 0 ]; then
        branch=""
    else
        branch="$bold$red$branch$reset"
    fi
  fi

  if [ "$PWD" == "/" ]; then
    dir="/"
  else
    dir="\w/"
  fi

  dir="${bold}${cyan}${dir} \n"

  PS1="\n$dir$reset${green}\$$reset "
  if [ $git -ne 0 ]; then
    git="$bold${orange}GIT${reset}: $repo, $branch,"
    PS1="\n${git} ${PS1}"
  fi

}

PROMPT_COMMAND=dev_prompt


  # httpd="${purple}apache[${reset}${cyan}"
  # running=$(ps ax | grep -v grep | grep httpd)
  # if  [ "${running}" == "" ]; then
  #     httpd="${httpd}off"
  # else
  #     httpd="${httpd}ON"
  # fi
  # httpd="${httpd}${reset}${purple}]${reset}"

