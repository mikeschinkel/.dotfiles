#!/usr/bin/env bash

echo Installing WPLib CLI...

save_dir=$(pwd)

echo "Change directory to /usr/local/bin..."
cd /usr/local/bin
echo

echo "Cloning WPLib CLI..."
git clone git@github.com:mikeschinkel/wplib-cli.git
echo

echo "Adding WPLib CLI to path..."
echo
new-path WPLIB-CLI "/usr/local/bin/wplib-cli/"

echo "Cleaning up..."
cd "${save_dir}"
echo

echo "Done."
echo
