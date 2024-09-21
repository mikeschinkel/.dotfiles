#!/bin/bash

echo "Running .dotfiles/bash_profile.sh..."
cd ~/.dotfiles/ || echo "Cannot cd to ~/.dotfiles/"
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)
PATH="${DOTFILES_DIR}/bin:${PATH}"
for bash_file in bash/0*.sh; do
	# shellcheck disable=SC1090
	source "${bash_file}"
	if [ $? != 0 ]; then
	  echo "An error occurred"
	  return
  fi
done
cd ~/ || echo "Cannot cd to ${HOME}"
printf "\nBash initialization complete."
