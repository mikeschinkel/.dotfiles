#!/usr/bin/env bash

echo Installing Sublime Text...
brew cask install sublime-text

echo Setting Preferences Files...
$sublime_dir=$(ls "~/Library/Application Support/" | grep Sublime)
sudo cp "../config/Preferences.sublime-settings" "~/Library/Application Support/${sublime_dir}/Packages/User/Preferences.sublime-settings"

