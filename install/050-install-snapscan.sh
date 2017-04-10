#!/usr/bin/env bash
#

echo Installing Snapscan software for Fujitsu JavaForOSXiX500...

save_file=$(pwd)
cd /tmp

dmg_file="MacSSInstiX500WW1"
echo "Downloading ${dmg_file}.dmg..."
wget "http://origin.pfultd.com/downloads/IMAGE/driver/ss/inst/ix500-ww1/${dmg_file}.dmg"
echo

echo Mounting DMG...
hdiutil attach "${dmg_file}.dmg"
echo

echo Running Snapscan software Installer...
open "/Volumes/${dmg_file}/SSInst.app/"
echo

echo Cleaning up...
detach-dmg "${dmg_file}"

rm "${dmg_file}.dmg"
