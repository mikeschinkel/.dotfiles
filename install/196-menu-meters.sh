#!/usr/bin/env bash
#
# See http://www.ragingmenace.com/software/menumeters/index.html
# See http://apple.stackexchange.com/a/1273/684
#

echo Installing Paragon Software ExtFS...
echo

save_dir=$(pwd)

echo "Downloading MenuMeters.dmg..."

cd /tmp
wget "http://www.ragingmenace.com/software/download/MenuMeters.dmg"

dmg_file="MenuMeters.dmg"

echo "Mounting DMG..."
echo y | hdiutil attach "${dmg_file}"
echo 

echo "Discovering MenuMeters folder name..." 
echo
installer_folder=$(ls /Volumes/ | grep MenuMeters)
cd "/Volumes/${installer_folder}"
echo

echo "Running Installer..." 
echo
open "MenuMeters Installer.app" 
echo

echo Cleaning up...
cd /tmp
detach-dmg "MenuMeters"
rm "{$dmg_file}"

echo
cd "${save_dir}"

pause "Remember to enable MenuMeter in Preferences..." 

