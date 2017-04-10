#!/usr/bin/env bash
#
# See: 
#

echo Installing iShowU...
save_dir=$(pwd)

cd /tmp

dmg_file="iShowU_1.94.3.dmg"

wget "http://www.shinywhitebox.com/downloads/${dmg_file}"

echo "Mounting ${dmg_file}..."
hdiutil attach "${dmg_file}"

echo "Moving ${dmg_file} to ~/Applications..."
cd ~/Applications
cp -r "/Volumes/iShowU/iShowU.app" .

echo Cleaning up...
detach-dmg iShowU

rm "${dmg_file}"

cd "${save_dir}"