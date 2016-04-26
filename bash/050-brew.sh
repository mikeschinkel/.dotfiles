#!/bin/bash
#

echo "Running .dotfiles/bash/040-brew.sh..."
echo 

read -e -n 1 -p "   Update Brew (y/N)? " update_brew
echo 

if [ "${update_brew}" == "y" ] || [ "${update_brew}" == "Y" ]; then

	echo "   Updating Brew..."
	echo

	brew_status=$(brew update)

	if [ "${brew_status}" == "Already up-to-date." ]; then
		brew_status="Done."
	fi
	echo "   ${brew_status}"
	echo

fi