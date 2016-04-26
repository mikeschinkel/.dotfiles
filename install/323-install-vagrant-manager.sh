#!/usr/bin/env bash
#
#  See: https://github.com/lanayotech/vagrant-manager/issues/133
#

echo Installing Vagrant Manager...
sudo brew cask install vagrant-manager

open -a "Vagrant Manager.app"

echo "Set the following Preferences manually:"
echo "  - Terminal Preferences:           iTerm/iTerm2"
echo "  - Launch at Login:                Yes"
echo "  - Require Option Key for Destroy: Yes"
echo "  - ANYTHING ELSE YOU WANT"
echo
pause "Press any key after Preferences are set..."
