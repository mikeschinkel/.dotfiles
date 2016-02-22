#!/usr/bin/env bash

echo "Setting Cloud Files..."
echo

mkdir -p "~/Cloud Files"
cd "~/Cloud Files"

mkdir -p "OneDrive"
mkdir -p "Google Drive"
mkdir -p "Box Sync"
mkdir -p "DropBox (NewClarity)"


ln -s  "${HOME}/OneDrive" "${HOME}/Cloud Files/OneDrive"
ln -s  "${HOME}/Google Drive" "${HOME}/Cloud Files/GDrive"
ln -s  "${HOME}/Box Sync" "${HOME}/Cloud Files/Box.com"
ln -s  "${HOME}/DropBox (NewClarity)" "${HOME}/Cloud Files/DropBox"
echo