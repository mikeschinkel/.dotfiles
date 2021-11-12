#!/bin/bash
#
#
echo "Running .dotfiles/bash/060-completions.sh..."

echo "Installing Brew completions"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi
echo -e ""

echo "Installing Git completions"
source "${DOTFILES_DIR}/git/git-completion.bash"
echo -e ""
