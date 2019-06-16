#!/usr/bin/env bash
#
# See https://my.paragon-software.com/#/dashboard/downloads
# Set https://dl.paragon-software.com/esd/Paragon-1092-PEU_MacInstallUnlock_11.2.16.dmg
#

echo Installing Paragon Software ExtFS...
echo

save_dir=$(pwd)
cd /tmp

dmg_file="${DOTFILES_DIR}/packages/Paragon-1092-PEU_MacInstallUnlock_11.2.16.dmg"

echo "Mounting DMG..."
echo y | hdiutil attach "${dmg_file}"
echo 
exit

echo "Running Installer..." 
echo
cd /Volumes/ParagonFS.localized/
open FSInstaller.app
echo

echo Cleaning up...
detach-dmg ParagonFS

echo
cd "${save_dir}"
