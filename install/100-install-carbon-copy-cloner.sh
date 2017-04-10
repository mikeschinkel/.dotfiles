#!/usr/bin/env bash

echo Installing Carbon Copy Cloner...
brew cask install carbon-copy-cloner

ln -s "/Applications/Carbon Copy Cloner.app/Contents/Library/LoginItems/CCC User Agent.app" "/Applications/CCC User Agent.app"

