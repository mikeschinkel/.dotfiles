#!/usr/bin/env bash

echo Installing Optimal Layout...
brew cask install optimal-layout

echo About to open Accessibility Settings
echo Click [Lock] to enable changes, then
echo Select [Checkbox] to give Optimal Layout access.
source pause "Press any key to open Accessibility Settings..."
open "${HOME}/Applications/Optimal Layout.app"