#!/usr/bin/env bash
#
# See Also (older version): brew cask install the-escapers-flux
#

save_dir=$(pwd)

echo Installing Flux...
cd /tmp 
echo 

echo "Downloading Flux..."
wpget https://s3.amazonaws.com/Flux/FluxV6.zip
echo 

echo "Releasing Flux from Quarantine..."
sudo xattr -r -d com.apple.quarantine Flux.app
echo 

echo "Moving Flux to ~/Applications..."
mv -f Flux.app ~/Applications
echo 

echo "Cleaning up..."
rm FluxV6.zip
echo

cd "${save_dir}"


