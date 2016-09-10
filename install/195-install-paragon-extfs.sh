#!/usr/bin/env bash
#
# See http://www.kedisoft.com/kb/index.php?n=AppShelf.FAQ
#

echo Installing Paragon Software ExtFS...
echo

save_dir=$(pwd)
dmg_file="${DOTFILES_DIR}/dmgs/Paragon-270-PEU_MacInstallUnlock_9.8.620_000.dmg"

echo "Mounting DMG..."
echo y | hdiutil attach "${dmg_file}"
echo 

echo "Running Installer..." 
echo
cd /Volumes/ParagonFS.localized/
open FSInstaller.app
echo

echo Cleaning up...
detach-dmg ParagonFS

echo
cd "${save_dir}"
