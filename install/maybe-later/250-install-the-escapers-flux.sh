#!/usr/bin/env bash
#
# See Also (older version): brew cask install the-escapers-flux
#
# See https://s3.amazonaws.com/Flux/FluxV6.zip
#

save_dir=$(pwd)

echo Installing Flux...
cd /tmp 
echo 

zip_file="${DOTFILES_DIR}/packages/FluxV6.zip"

echo "Copying ${zip_file}..."
cp "${zip_file}" .

echo "Unzipping..."
echo y | unzip "${zip_file}" >/dev/null  2>&1

# echo "Downloading Flux..."
# wget https://s3.amazonaws.com/Flux/FluxV6.zip
# echo 

# echo "Releasing Flux from Quarantine..."
# sudo xattr -r -d com.apple.quarantine Flux.app
# echo 

echo "Moving Flux to /Applications..."
rm -rf /Applications/Flux.app 
mv Flux.app /Applications/

echo "Cleaning up..."
rm FluxV6.zip
echo

cd "${save_dir}"


