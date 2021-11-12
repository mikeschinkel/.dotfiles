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

if [ -f ${DOTFILES_DIR}/git/git-completion.bash ]; then
  printf "   Installing Git completions\n"
  source ${DOTFILES_DIR}/git/git-completion.bash
fi

if [ -e "${HOME}/.iterm2_shell_integration.bash" ]; then
  printf "   Installing iTerm2 shell integrations\n"
  source "${HOME}/.iterm2_shell_integration.bash"
fi

echo -e ""
