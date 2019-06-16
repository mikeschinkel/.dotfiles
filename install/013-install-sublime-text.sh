#!/usr/bin/env bash

echo Installing Sublime Text...
brew cask install sublime-text

echo Setting Preferences Files...
sublime_dir=$(find ~/"Library/Application Support" 2>/dev/null | grep "Sublime Text" | head -1)


sudo cp "${DOTFILES_DIR}/config/Preferences.sublime-settings" "${sublime_dir}/Packages/User"

