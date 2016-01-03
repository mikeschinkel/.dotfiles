#!/usr/bin/env bash
#
# Setup for a new installed Mac OS X
#
# Eventually it will be almost fully complete.

cd ~/
sudo echo 'source ~/.dotfiles/.bash_profile' >> ~/.bash_profile
sudo chmod +x ~/.dotfiles/.osx.sh
sudo sh ~/.dotfiles/.osx.sh
