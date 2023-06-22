#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."

cd ~/.dotfiles/
export DOTFILES_DIR=$(pwd)

for bash_file in bash/0*.sh; do

	source "${bash_file}"

done
cd ~/

#HISTCONTROL=erasedups:ignoreboth
#HISTFILESIZE=2048
#if [ "${ITERM_SESSION_ID}" == "" ]; then
#    export HISTFILE=~/.bash-history/ssh
#else
#    export HISTFILE=~/.bash-history/${ITERM_SESSION_ID}
#fi
#if [ ! -r "${HISTFILE}" ]; then
#    history -r ~/.bash_history
#    history -w ${HISTFILE}
#fi

printf "\nBash initialization complete."

#
# Display Menu 
#
#ln -sf ~/.dotfiles/menu.sh /usr/local/bin/m
#m

