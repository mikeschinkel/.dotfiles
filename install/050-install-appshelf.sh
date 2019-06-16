#!/usr/bin/env bash
#
# See http://www.kedisoft.com/kb/index.php?n=AppShelf.FAQ
#

echo Installing AppShelf...
echo

save_dir=$(pwd)
dmg_file="AppShelf-2.3.5.dmg"
local_dir="Library/Application Support/AppShelf"
appshelf_dir="${HOME}/${local_dir}"
appshelf_db="AppShelf.db"

cd /tmp
wget "http://www.kedisoft.com/dl/appshelf/${dmg_file}"
echo 

echo "Mounting DMG..."
echo y | hdiutil attach "${dmg_file}"
echo 

exit

echo "Copying AppShelf.app to ~/Applications..." 
echo
cd ~/Applications
cp -a  "/Volumes/AppShelf/AppShelf.app" .
echo

echo Cleaning up...
detach-dmg AppShelf

rm "${dmg_file}"

echo
cd "${save_dir}"
exit

cd "${DOTFILES_DIR}/data"

if [ -f "${appshelf_db}" ]; then
	rm "${appshelf_db}"
fi
unencrypt "${appshelf_db}.gpg"
echo

echo "Moving ${appshelf_db} to ~/${local_dir}..."
mkdir -p "${appshelf_dir}"
mv AppShelf.db "${appshelf_dir}"

cd "${save_dir}"