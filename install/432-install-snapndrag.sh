#!/usr/bin/env bash

echo "Installing SnapNDrag..."
echo

save_dir=$(pwd)
cd /tmp

dmg_file="SnapNDrag.dmg"

echo "Downloading SnapNDrag..."
echo
wget "http://yellowmug.com/download/${dmg_file}"
echo

echo "Mounting ${dmg_file}..."
echo
hdiutil attach "${dmg_file}"
echo

echo "Copying SnapNDrag.app to ~/Applications..." 
echo
cd ~/Applications
cp -r /Volumes/SnapNDrag/SnapNDrag.app .
echo

echo "Cleaning up..."
echo
detach-dmg.sh SnapNDrag

cd "${save_dir}"
rm -Rf "/tmp/${dmg_file}"
echo 