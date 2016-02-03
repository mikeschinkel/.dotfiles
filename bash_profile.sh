#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."


for FILE in bash/*.sh; do

	source "${FILE}"

done
echo
echo "Bash initialization complete."

