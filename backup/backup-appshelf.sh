#!/usr/bin/env bash
#
#

save_dir=$(pwd)

local_dir="Library/Application Support/AppShelf"
appshelf_dir="${HOME}/${local_dir}"
appshelf_db="AppShelf.db"
appshelf_db_file="${appshelf_dir}/${appshelf_db}"
backup_file="${appshelf_db}.gpg"
appshelf_backup_file="${appshelf_dir}/${backup_file}"
backup_file_dir="${DOTFILES_DIR}/data/"

cd "${appshelf_dir}"
rm "${backup_file}" 2> /dev/null
encrypt-file "${appshelf_db}"

echo 
echo "Moving ${backup_file} to ${backup_file_dir}..."
rm "${backup_file_dir}/${backup_file}" 2> /dev/null
mv "${appshelf_backup_file}" "${backup_file_dir}"

cd "${save_dir}"



