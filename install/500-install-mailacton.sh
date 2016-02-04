#!/usr/bin/env bash

echo Installing MailActOn...
wget http://media.indev.ca/releases/MailActOn3Current.dmg

echo Mounting DMG...
hdiutil attach MailActOn3Current.dmg

echo "Running MailActOn Installer..."
open "/Volumes/Install Mail Act-On 3/Install Mail Act-On.app"
pause.sh "Press any key AFTER you have installed Mail Act-On..."

echo Cleaning up...
detach-dmg.sh "Install Mail Act-On"

rm MailActOn3Current.dmg

