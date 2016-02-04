#!/usr/bin/env bash
#
#
echo NOT FULLY TESTED
exit

cd ~/.dotfiles

echo "Running .dotfiles/install.sh..."

export install_files="${DOTFILES_DIR}/install"

for install_file in ${install_files}/*.sh; do

	#remove filepath and .sh extension
	basename=$(basename -s .sh $install_file)

  	echo "Processing ${basename} file..";

  	chmod +x "${install_file}"
  	source "${install_file}"

  	echo

done