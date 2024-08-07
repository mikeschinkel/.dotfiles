#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."

cd ~/.dotfiles/ || echo "Cannot cd to ~/.dotfiles/"
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

for bash_file in bash/0*.sh; do
	# shellcheck disable=SC1090
	source "${bash_file}"
done
cd ~/ || echo "Cannot cd to ${HOME}"

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

