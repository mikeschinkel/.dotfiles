#!/usr/bin/env bash
#
# See: 
# 
#  - https://derflounder.wordpress.com/2012/11/20/clearing-the-quarantine-extended-attribute-from-downloaded-applications/
#

echo Installing Skitch...
brew cask install skitch

echo Installing Skitch Classic...
save_dir=$(pwd)

cd "${DOTFILES_DIR}/apps"

unzip -q -o skitch-1-0-7-en-mac.zip
sudo xattr -r -d com.apple.quarantine Skitch.app

mv -f Skitch.app "Skitch Classic.app"
mv -f "Skitch Classic.app" ~/Applications

cd "${save_dir}"


