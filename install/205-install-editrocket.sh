#!/usr/bin/env bash

echo "Installing EditRocket..."
echo

save_dir=$(pwd)
cd /tmp

dmg_file="editrocket4_3_1_x64.dmg"

echo "Downloading EditRocket..."
echo
wget "http://downloads.editrocket.com/downloads/4_3_1/${dmg_file}"
echo

echo "Mounting ${dmg_file}..."
echo
hdiutil attach "${dmg_file}"
echo

echo "Copying EditRocket.app to ~/Applications..." 
echo
cd ~/Applications
cp -r /Volumes/EditRocket/EditRocket.app .
echo

echo "Cleaning up..."
echo
detach-dmg.sh EditRocket

cd "${save_dir}"
rm -Rf "/tmp/${dmg_file}"
echo 