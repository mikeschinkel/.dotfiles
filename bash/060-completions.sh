#!/bin/bash
#
#
echo "Running .dotfiles/bash/060-completions.sh..."

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi
echo -e ""