#!/usr/bin/env bash
#
# See: 
#

echo Installing ScreenFlow...
save_dir=$(pwd)

cd /tmp

dmg_file="ScreenFlow-4.5.dmg"

wget "http://macheist.com/order/download/1FF810674D9428641/135/${dmg_file}"

echo "Mounting ${dmg_file}..."
hdiutil attach "${dmg_file}"

echo "Moving ${dmg_file} to ~/Applications..."
cd ~/Applications
cp -r "/Volumes/ScreenFlow/ScreenFlow.app" .

echo Cleaning up...
detach-dmg ScreenFlow

rm "${dmg_file}"

cd "${save_dir}"