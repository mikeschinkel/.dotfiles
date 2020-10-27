#!/bin/bash
#
#
echo "Running .dotfiles/bash/070-defaults.sh..."

#
# Change Google Chrome check for updates to only once per week
#
# See: https://www.macobserver.com/tmo/article/how-manage-the-secret-software-that-google-chrome-installs-on-your-mac
#
defaults write com.google.Keystone.Agent checkInterval 604800