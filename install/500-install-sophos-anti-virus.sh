#!/usr/bin/env bash
#
# Note: Recommended by XWP as required for NewsCorp VPN 
#

save_dir=$(pwd)

echo "Installing Sophos Anti-Virus Home Edition..."
echo 

cd "${DOTFILES_DIR}/apps"

dirname="Sophos"
zipname="savosx_he_r.zip"
installername="Sophos Anti-Virus Home Edition.app"

echo "Making directory ${dirname}..."
mkdir -p "${dirname}"
cd  "${dirname}"
echo

echo "Unzipping ${zipname}..."
unzip -q -o "../${zipname}"
echo 

echo "Running ${installername}..."
echo "Loading Sophos Anti-Virus Installer UI."
pause "Press any key when ready..."
open "${installername}"
echo 

pause "Press any key for cleanup..."
echo
echo "Cleaning up..."
cd ..
rm -Rf "${dirname}"
echo

cd "${save_dir}"


