#!/usr/bin/env bash
#
#  Restore the PhpStorm files listed here from an PhpStorm.zip file:
#
#		https://www.jetbrains.com/phpstorm/help/directories-used-by-phpstorm-to-store-settings-caches-plugins-and-logs.html
#		https://www.jetbrains.com/phpstorm/help/project-and-ide-settings.html
#
# Encrypt file as here:
#
#		https://kb.iu.edu/d/awio
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

settings_dir="${DOTFILES_DIR}/settings"
cd $settings_dir

echo "Getting PhpStorm Version..."
phpstorm_version=$(find . | grep gpg | grep PhpStorm | tr "." "\n" |sed -n 3p)
echo "   Version is ${phpstorm_version}"
echo

gpg_file="PhpStorm.${phpstorm_version}.zip.gpg"
echo "Unencrypting ${gpg_file}..."
gpg "${gpg_file}"
echo

zip_file="PhpStorm.${phpstorm_version}.zip"
echo "Unzipping ${zip_file} into PhpStorm/..."
unzip -q -o "${zip_file}"
echo 

echo "Removing ${zip_file}..."
rm "${zip_file}"
echo

ls -al
ls -al PhpStorm

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
