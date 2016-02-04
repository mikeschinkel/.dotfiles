#!/usr/bin/env bash
#
#  Backup the PhpStorm files listed here into an PhpStorm.zip file:
#
#		https://www.jetbrains.com/phpstorm/help/directories-used-by-phpstorm-to-store-settings-caches-plugins-and-logs.html
#


save_dir=$(pwd)
#home_dir="/"
#root_dir="${HOME}/"
home_dir="/Volumes/MACBOOK-PRO-MIRROR"
root_dir="${home_dir}/Users/mikeschinkel/"
app_dir="${home_dir}/Applications/PhpStorm.app/Contents/bin/"

phpstorm_ver="100"
#phpstorm_dirs="Preferences|Caches|Application Support"
phpstorm_dirs="Preferences|Application Support"
cur_dir=$(dirname $(pwd))
backups_dir="${cur_dir}/backups"
backup_dir="${backups_dir}/PhpStorm"

# if [ -d "PhpStorm" ]; then 
# 	echo
# 	echo "   FAIL: ${save_dir}/PhpStorm exists. Cannot continue."
# 	exit
# fi 

# if [ -f "PhpStorm.zip" ]; then 
# 	echo "   FAIL: ${save_dir}/PhpStorm.zip exists. Cannot continue."
# 	exit
# fi 

echo 

echo "Making directory ${backup_dir}..."
mkdir -p "${backup_dir}"
echo 

echo "Saving PhpStorm version ${phpstorm_ver} to PHPSTORM_VERSION..."
phpstorm_ver_file="${backup_dir}/PHPSTORM_VERSION"
echo "${phpstorm_ver}" > $phpstorm_ver_file
echo 

echo "Saving idea.properties from ${app_dir}..."
cp "${app_dir}idea.properties" "${backup_dir}"
echo 

IFS="|"
for phpstorm_dir in $phpstorm_dirs; do
	phpstorm_slug=$(echo "${phpstorm_dir}" | tr " " "-")
	rel_dir="Library/${phpstorm_dir}"
	source_dir="${root_dir}${rel_dir}/WebIde${phpstorm_ver}"
	cd "${source_dir}"
	backup_file="${backup_dir}/${phpstorm_slug}.zip"
	echo " In Dir: ${source_dir}"
	echo "Zipping: ${phpstorm_dir}"
	echo "     To: ${backup_file}..."
	echo 
	zip -r -q "${backup_file}" . 
done

backup_file="${backups_dir}/PhpStorm.${phpstorm_ver}.zip"

echo "Zipping ${backup_file}..."
cd "${backups_dir}"
zip -r -q "${backup_file}" "PhpStorm"
echo 

echo "Cleaning up."
cd "${save_dir}"
rm -Rf "${backup_dir}"
echo 

echo "Done."
echo 
