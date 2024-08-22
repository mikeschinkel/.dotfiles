#!/bin/bash
#
#

echo "Running .dotfiles/bash/055-aliases.sh..."

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdp=cd_projects

#
# Git
#
alias gs="git status"
alias gpl="git pull"
alias gps="git push"
alias gcm=git_commit_with_message
alias gl="git log"
alias glo="git log --oneline -20"


# shellcheck disable=SC2139
alias snd="pbpaste|ncat ${NETCAT_SEND_IP} 12345"
alias rcv='ncat -l -p 12345'


git config --global alias.tags 'tag -n99'

#
# Find from Root with Grep
#
alias frg=find_root_grep

#
# Find from Home with Grep
#
alias fhg=find_home_grep

#
# Just Find '.' with Grep
#
alias f=find_grep

alias largest-files='find . -type f -exec du -a {} + | sort -n -r | head -n 20'


alias move-downloads="rsync -avzh --remove-source-files --progress ~/Downloads/ /Volumes/JetDrive/Downloads && find ~/Downloads -type d -empty -delete"

# Make Bash use the one from Homebrew
alias rsync='/usr/local/bin/rsync'

#Now output the aliases we have so we don't forget about them.
printf "\n  ALIASES:\n%s\n\n" "$(alias|awk '{$1=""; sub(/^ /,"    "); print}')"