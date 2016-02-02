#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."


for FILE in bash/*.sh; do

	sudo chmod +x "${FILE}"
	source "${FILE}"

done
echo
echo "Bash initialization complete."

