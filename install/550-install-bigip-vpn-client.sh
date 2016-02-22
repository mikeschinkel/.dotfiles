#!/usr/bin/env bash
#
# See: 
# 
#

save_dir=$(pwd)

echo "Installing Big IP VPN Client..."
echo 

cd "${DOTFILES_DIR}/apps"

dirname="MAC VPN Software"
zipname="MAC_VPN_Software-2016-01-28.zip"
gpgname="${zipname}.gpg"
pkgname="mac_edgesvpn.pkg"
inspectorsdir="Library/F5Networks/Inspectors/"

echo "Unencrypting ${gpgname}..."
gpg "${gpgname}"
echo 

echo "Unzipping ${zipname}..."
unzip -q -o "${zipname}"
echo 

echo "Installing ${pkgname}..."
sudo installer -package "${dirname}/${pkgname}" -target /
echo 

echo "Making Inspectors Directory..."
mkdir -p "${HOME}/${inspectorsdir}"

echo "Cleaning up..."
rm -Rf "${dirname}"
rm "${zipname}"
echo

cd "${save_dir}"


