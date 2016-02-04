#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."

export DOTFILES_DIR=$(dirname "${BASH_SOURCE}")

for FILE in bash/*.sh; do

	source "${FILE}"

done
echo
echo "Bash initialization complete."

