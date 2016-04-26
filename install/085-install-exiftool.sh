#!/usr/bin/env bash
#
# See:
#	
#	- http://www.sno.phy.queensu.ca/~phil/exiftool/
#

echo "InstallingExifTool ..."

save_file=$(pwd)
cd /tmp

file_root="ExifTool-10.11"
dmg_file="${file_root}.dmg"

wget "http://www.sno.phy.queensu.ca/~phil/exiftool/${dmg_file}"
echo 


echo "Mounting DMG..."
hdiutil attach "${dmg_file}"
echo 

echo "Installing via Package..."
sudo installer -package "/Volumes/${file_root}/${file_root}.pkg" -target /
echo


echo Cleaning up...
detach-dmg "${file_root}"

rm "${dmg_file}"
echo

cd "${save_file}"

