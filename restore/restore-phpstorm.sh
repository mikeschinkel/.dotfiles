#!/usr/bin/env bash
#
#  Restore the PhpStorm files listed here from an PhpStorm.zip file:
#
#		http://support.indev.ca/kb/mao-advanced-techniques/manually-moving-act-on-files-to-a-new-computer
#

save_dir=$(pwd)

# if [ -d "PhpStorm" ]; then 
# 	echo
# 	echo "   FAIL: ${save_dir}/PhpStorm/ exist.  Cannot continue."
# 	exit;
# fi 

# if [ ! -f "PhpStorm.zip" ]; then 
# 	echo
# 	echo "   FAIL: ${save_dir}/PhpStorm.zip does not exist.  Cannot continue."
# 	exit;
# fi 

# cd ~/.dotfiles/zips

# unzip -q -o PhpStorm.zip

# cd PhpStorm
# this_dir=$(pwd)

# echo

# dirs="Preferences|Caches|Application Support"
# IFS="|"
# for dir in $dirs; do
# 	rel_path="Library/${dir}/WebIde${phpstorm_ver}"
# 	source_path="${root_dir}${rel_path}"
# 	dest_path="PhpStorm/${rel_path}"
# 	mkdir -p "${save_dir}/${dest_path}"
# 	echo "cp -r ${source_path} ${dest_path}"
# 	cp -r ${source_path} ${dest_path}
# done


# find . | while read cur_file; do
# 	this_file="${this_dir}/${cur_file}"
# 	if [ -d "${this_file}" ]; then
# 		rm -Rf "${this_file}"
# 	fi
# done
# find . | while read cur_file; do

# 	cur_file="${cur_file:2}"
# 	full_path="${HOME}/${cur_file}"

# 	if [ -f "${full_path}" ]; then 
# 		NOTE="OVER"
# 	else		
# 		NOTE="  TO"
# 	fi
# 	#echo "COPYING: ${cur_file}"
# 	#echo "   ${NOTE}: ${full_path}..."
# 	#echo
# 	dirpath=$(dirname "${full_path}")
# 	mkdir -p "${dirpath}" 2> /dev/null
# 	this_file="${this_dir}/${cur_file}"
# 	if [ -f "${this_file}" ]; then
# 		cp -r "${this_file}" "${full_path}"
# 	fi
# done

# cd ..
# rm -Rf PhpStorm

cd "${save_dir}"

echo Done.
