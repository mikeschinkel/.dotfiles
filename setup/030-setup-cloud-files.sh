#!/usr/bin/env bash

echo "Setting Cloud Files..."
echo

mkdir -p "~/Cloud Files"
cd "~/Cloud Files"

mkdir -p "${HOME}/OneDrive"
mkdir -p "${HOME}/Google Drive"
mkdir -p "${HOME}/Box Sync"
mkdir -p "${HOME}/DropBox"

mkdir -p "${HOME}/Cloud Files/OneDrive"
mkdir -p "${HOME}/Cloud Files/Google Drive"
mkdir -p "${HOME}/Cloud Files/Box Sync"
mkdir -p "${HOME}/Cloud Files/DropBox"

ln -sf  "${HOME}/OneDrive" "${HOME}/Cloud Files/OneDrive"
ln -sf  "${HOME}/Google Drive" "${HOME}/Cloud Files/GDrive"
ln -sf  "${HOME}/Box Sync" "${HOME}/Cloud Files/Box.com"
ln -sf  "${HOME}/DropBox" "${HOME}/Cloud Files/DropBox"
echo
