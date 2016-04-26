#!/usr/bin/env bash
#
# See install/071-install-php.sh
#
# See Also: 
#		https://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions
#		https://github.com/conradkleinespel/sphp-osx
#		https://github.com/wilmoore/php-version
#
# Note: xdebug.remote_port MUST BE 9001 as FPM uses 9000
#

echo 
echo "Switching PHP to version $1..."
echo 

echo "Parsing major and minor versions from [$1]..."
echo 

major_version=$(echo "$1" | cut -f1 -d".")
minor_version=$(echo "$1" | cut -f2 -d".")
unlink="$2"

version_slug="php${major_version}${minor_version}"
dot_version="${major_version}.${minor_version}"

echo "     Major: ${major_version}"
echo "     Minor: ${minor_version}"
echo "   Version: ${dot_version}"
echo "      Slug: ${version_slug}"
echo 

phpini_dir="/usr/local/etc/php/${dot_version}/"
phpconf_dir="/usr/local/etc/php/${version_slug}/conf.d"
php_dir="/usr/local/opt/${version_slug}"
phpbin_file="/usr/local/opt/${version_slug}/bin/php"
xdebug_file="${phpconf_dir}/ext-xdebug.ini"
zend_extension="${php_dir}-xdebug/xdebug.so" 

echo "  Ini File: ${phpini_dir}"
echo "   PHP bin: ${phpbin_file}"
echo "  Zend Ext: ${zend_extension}"
echo 

installed=$(php -v | head -n 1 | cut -f2  -d" " | cut -f1 -f2 -d".")
if [ "" != "${installed}" ]; then
	echo "Unlinking Brew installed PHP and XDEBUG version ${installed}..."
	echo 
	installed_slug="php${installed//.}"
	brew unlink "${installed_slug}" 2>/dev/null
	brew unlink "${installed_slug}-xdebug" 2>/dev/null
	echo
fi

if [ ! -f "${phpbin_file}" ]; then
	echo "Brew installing PHP ${dot_version}..."
	brew install "${version_slug}"
	echo
fi

if [ ! -f "${zend_extension}" ]; then
	echo "Brew installing XDEBUG for PHP ${dot_version}..."
	brew install "${version_slug}-xdebug"
	echo
fi

echo "Brew linking installed PHP ${dot_version}..."
echo
brew link "${version_slug}" 2>/dev/null
brew link "${version_slug}-xdebug" 2>/dev/null
echo 

echo "Making directory ${phpconf_dir}..."
mkdir -p "${phpconf_dir}"
echo 

if [ -f "${xdebug_file}" ]; then
	echo "Deleting existing ${xdebug_file}..."
	sudo rm "${xdebug_file}"
	echo
fi


echo "Creating ${xdebug_file}..."
sudo echo zend_extension="${zend_extension}" > ${xdebug_file}
echo

echo "Adding directives to ${xdebug_file}..."
sudo echo xdebug.remote_enable=1			>> ${xdebug_file}
sudo echo xdebug.remote_host="localhost"	>> ${xdebug_file}
sudo echo xdebug.remote_port=9001			>> ${xdebug_file}
sudo echo xdebug.idekey="PHPSTORM"			>> ${xdebug_file}
sudo echo xdebug.remote_connect_back=1		>> ${xdebug_file}
sudo echo xdebug.remote_autostart=1			>> ${xdebug_file}
sudo echo xdebug.remote_handler=dbgp		>> ${xdebug_file}
echo 

echo "Displaying ${xdebug_file}..."
echo 
cat "${xdebug_file}"
echo

if [ "unlink" == "${unlink}" ]; then
	echo "Brew unlinking PHP and XDEBUG for version ${dot_version}..."
	brew unlink "${version_slug}-xdebug"
	brew unlink "${version_slug}"
else	
	echo "Symlinking PHP ${dot_version} for Mac OS X launch agents..."
	echo
	plist_file="homebrew.mxcl.${version_slug}.plist"
	launchagents_dir="${HOME}/Library/LaunchAgents"

	echo "Symlinking ${plist_file} to ~/Library/LaunchAgents/..."
	echo
	ln -sfv "${php_dir}/${plist_file}" "${launchagents_dir}"
	echo

	echo "Adding ${plist_file} to ~/Library/LaunchAgents/..."
	launchctl load "${launchagents_dir}/${plist_file}"
fi
echo 

echo "Done."
echo 
