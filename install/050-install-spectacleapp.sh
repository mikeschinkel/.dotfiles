#!/usr/bin/env bash

#
# https://www.spectacleapp.com/
#


echo "Installing Spectacle..."
save_dir=$(pwd)
cd /tmp
echo
echo "Downloading Spectacle..."
echo 
wget https://s3.amazonaws.com/spectacle/downloads/Spectacle+1.2.zip
echo 
echo "Unzipping Spectacle..."
echo 
unzip "Spectacle+1.2.zip"
echo 
echo "Moving Spectacle to /Applications..."
mv Spectacle.app /Applications
echo 
echo "Cleaning up..."
rm Spectacle+1.2.zip
echo 
cd "${pwd}"
echo "Done."
