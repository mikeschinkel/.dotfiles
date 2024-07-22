#!/bin/bash
#
#
printf "Running .dotfiles/bash/060-completions.sh...\n\n"

if type brew &>/dev/null
then
  printf "   Installing Brew completions\n"
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi


if [ -f "${NVM_DIR}/bash_completion" ]; then
  printf "   Installing NVM completions\n"
  source "${NVM_DIR}/bash_completion"
fi

# These run the few scripts with a .bash extension
for bash_file in bash/*.bash; do
	source "${bash_file}"
done

echo -e ""
