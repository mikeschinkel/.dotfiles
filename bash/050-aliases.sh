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
alias k='kubectl'
alias ka='kubectl apply '
alias kc='kubectl create '
alias kd='kubectl delete '

#
# NetCat Send & Receive
#
alias rcv='netcat -l -p 12345'
alias snd='pbpaste|netcat 192.168.1.10 12345'

#
# Git
#
alias grs="git reset --soft"
alias grh="git reset --soft"
alias gs="git status"
alias gpl="git pull"
alias gps="git push"
alias gcm=git_commit_with_message
alias gl="git log"
alias glo="git log --oneline -20"

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