#!/usr/bin/env bash

echo Installing Optimal Layout...
brew cask install optimal-layout

echo About to open Accessibility Settings
echo Click [Lock] to enable changes, then
echo Select [Checkbox] to give Optimal Layout access.
source pause.sh "Press any key to open Accessibility Settings..."
open "/Users/mikeschinkel/Applications/Optimal Layout.app"
