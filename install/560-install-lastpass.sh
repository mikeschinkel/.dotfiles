#!/usr/bin/env bash
#
# See: 
#

echo Installing LastPass...
brew cask install lastpass
open "/opt/homebrew-cask/Caskroom/lastpass/latest/LastPass Installer.app"
pause "Press any key AFTER setting up LastPass..."