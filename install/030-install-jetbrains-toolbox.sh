#!/usr/bin/env bash
#

echo Installing JetBrains Toolbox...
brew cask install jetbrains-toolbox

echo Installing PhpStorm...
brew cask install phpstorm

echo Installing GoLand...
brew cask install goland

echo Installing DataGrip...
brew cask install datagrip

echo "Remember to set keymap for 'Main Menu/File/Close Project' to Alt-Q."
pause