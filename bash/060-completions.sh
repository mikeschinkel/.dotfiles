#!/bin/bash
#
#
printf "Running .dotfiles/bash/060-completions.sh...\n\n"

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  printf "   Installing Brew completions\n"
   source "$(brew --prefix)/etc/bash_completion"
fi

if [ -f "${NVM_DIR}/bash_completion" ]; then
  printf "   Installing NVM completions\n"
  source "${NVM_DIR}/bash_completion"
fi

for bash_file in bash/*.bash; do
	source "${bash_file}"
done

echo -e ""
