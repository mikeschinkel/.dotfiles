#!/usr/bin/env bash

echo Installing Google Drive File Stream for mike@newclarity.net...
brew cask install google-drive-file-stream

echo Installing Backup and Sync for miksch1@gmail.com...
cd /tmp
echo

dmg_basefile="InstallBackupAndSync.dmg"

echo Downloading...
wget "https://dl.google.com/drive/${dmg_basefile}"
echo

#dmg_file="${DOTFILES_DIR}/packages/${dmg_basefile}"
dmg_file="${dmg_basefile}"

echo "Mounting DMG..."
echo y | hdiutil attach "${dmg_file}"
echo 

volume="Install Backup and Sync from Google"
appFrom="Backup and Sync.app"
appTo="Backup and Sync from Google.app"

echo "Copying " 
echo
sudo cp -r "/Volumes/${volume}/${appFrom}" "/Applications/${appTo}"
echo

echo Cleaning up...
detach-dmg "${volume}"
rm "/tmp/${dmg_basefile}"
echo

pause "Press any key to setup Google Backup and Sync..."
echo
open "/Applications/${appTo}"





