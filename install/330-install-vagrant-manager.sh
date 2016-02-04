#!/usr/bin/env bash

echo Installing Vagrant Manager...
sudo brew cask install vagrant-manager

open -a "Vagrant Manager.app"

echo "Set the following Preferences manually:"
echo "  - Terminal Preferences:           iTerm/iTerm2"
echo "  - Launch at Login:                Yes"
echo "  - Require Option Key for Destroy: Yes"
echo "  - ANYTHING ELSE YOU WANT"
echo
pause.sh "Press any key after Preferences are set..."
