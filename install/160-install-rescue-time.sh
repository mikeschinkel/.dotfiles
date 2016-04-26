#!/usr/bin/env bash

echo Installing RescueTime...
brew cask install rescuetime

echo About to open Email Activation and Accessibility Settings
echo For Email Activation use ${PERSONAL_EMAIL}
echo Click [Lock] to enable changes, then
echo Select [Checkbox] to give Rescue Time access.
source pause "Press any key to open Accessibility Settings..."
open "/Users/mikeschinkel/Applications/RescueTime.app"
