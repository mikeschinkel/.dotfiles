#!/bin/bash
#
# See: https://github.com/postmodern/chruby
# See: 
#

echo "Running .dotfiles/bash/045-ruby.sh..."

echo
#echo "Sourcing chruby..."
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#echo
#echo "   Indentifying OS X's Ruby in /usr/bin..."
#RUBIES=(
#	/usr/bin
#	~/.rubies/*
#)
#echo "   Changing to Ruby 2.3.x..."
#chruby 2.3.1
#echo

echo "   Sourcing rvm..."
source /Users/mikeschinkel/.rvm/scripts/rvm
# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi
echo
