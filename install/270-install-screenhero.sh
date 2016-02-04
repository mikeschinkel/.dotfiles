#!/usr/bin/env bash

echo Installing ScreenHero...
wget https://secure.screenhero.com/update/screenhero/Screenhero.dmg

echo Mounting DMG...
hdiutil attach Screenhero.dmg

echo Installing ScreenHero...
cp -r /Volumes/Screenhero/Screenhero.app ~/Applications

echo Cleaning up...
detach-dmg.sh Screenhero

rm Screenhero.dmg

