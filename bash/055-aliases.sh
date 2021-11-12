#!/bin/bash
#
#

echo "Running .dotfiles/bash/055-aliases.sh..."

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#
# Reboot Mac Mini
#
alias rmm="ssh mikeschinkel@mac-mini.local 'sudo reboot'"

#
# Vagrant
#
alias vs="vagrant status"
alias vu="vagrant up"
alias vr="vagrant reload"
alias vrp="vagrant reload --provision"
alias vh="vagrant halt"
alias vd="vagrant destroy"
alias vssh="vagrant ssh"

#
# Git
#
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
alias fr=find_root_grep

#
# Find from Home with Grep
#
alias fh=find_home_grep

#
# Just Find '.' with Grep
#
alias f=find_grep

echo -e ""


alias largest-files='find . -type f -exec du -a {} + | sort -n -r | head -n 20'