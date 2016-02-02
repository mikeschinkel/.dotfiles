#!/usr/bin/env bash

echo Installing Sublime...
brew cask install sublime

echo Setting Preferences Files...
sudo cp ../config/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

