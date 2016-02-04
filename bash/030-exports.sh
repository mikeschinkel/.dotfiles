#!/usr/bin/env bash
#
# Export vars.
#

echo "Running .dotfiles/bash/030-exports.sh..."

echo

export_files="${DOTFILES_DIR}/exports"

for export_file in ${export_files}/*.sh; do

	#remove filepath and .sh extension
	basename=$(basename -s .sh $export_file)

  	#echo "Processing exports/${basename}.sh file..";
  	export_var=$(to-upper.sh "${basename}")

  	chmod +x ${export_files}/${basename}.sh
  	export_file="${export_files}/${basename}.sh"
  	export_value=$(${export_file})

  	echo "  Exporting ${export_var}=${export_value}"
  	export $export_var="${export_value}"

done    
echo
