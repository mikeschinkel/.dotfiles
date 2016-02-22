#!/usr/bin/env bash
#
# See http://www.kedisoft.com/kb/index.php?n=AppShelf.FAQ
#

echo Installing AppShelf...
echo DO SOMETHING HERE TO INSTALL...

local_dir="Library/Application Support/AppShelf"
appshelf_dir="${HOME}/${local_dir}"
appshelf_db="AppShelf.db"

save_dir=$(pwd)

cd "${DOTFILES_DIR}/data"

if [ -f "${appshelf_db}" ]; then
	rm "${appshelf_db}"
fi
unencrypt.sh "${appshelf_db}.gpg"
echo

echo "Moving ${appshelf_db} to ~/${local_dir}..."
mkdir -p "${appshelf_dir}"
mv AppShelf.db "${appshelf_dir}"

cd "${save_dir}"