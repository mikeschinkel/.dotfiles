#!/usr/bin/env bash
#
# See: 
#

echo Installing iShowU Studio...
save_dir=$(pwd)

cd /tmp

dmg_file="iShowU_Studio_1.6.0.dmg"

wget "http://www.shinywhitebox.com/downloads/${dmg_file}"

echo "Mounting ${dmg_file}..."
hdiutil attach "${dmg_file}"

echo "Moving ${dmg_file} to ~/Applications..."
cd ~/Applications
cp -r "/Volumes/iShowU Studio/iShowU Studio.app" .

echo Cleaning up...
detach-dmg "iShowU Studio"
cd /tmp
rm "${dmg_file}"

cd "${save_dir}"