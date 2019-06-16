#!/usr/bin/env bash

echo Installing Remotix...
wget http://downloads.nulana.com/remotix/Remotix.dmg

echo Mounting DMG...
hdiutil attach Remotix.dmg

echo Installing Remotix...
cp -r /Volumes/Remotix/Remotix.app /Volumes/Remotix/Applications

echo Cleaning up...
detach-dmg Remotix

rm Remotix.dmg

