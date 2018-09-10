#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."

cd ~/.dotfiles/
export DOTFILES_DIR=$(pwd)

for bash_file in bash/*.sh; do

	source "${bash_file}"

done
cd ~/
echo "Bash initialization complete."

#
# Display Menu 
#
#ln -sf ~/.dotfiles/menu.sh /usr/local/bin/m
#m

