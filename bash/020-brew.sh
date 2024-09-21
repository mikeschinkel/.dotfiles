#!/bin/bash

echo "Running .dotfiles/bash/050-brew.sh..."

#Output Homebrew Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

#Run as a Daemon in the background
screen -dm "update_brew" "brew update"
