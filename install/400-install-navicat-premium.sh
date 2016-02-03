#!/usr/bin/env bash
#
# See http://superuser.com/a/819992/46038
#

#echo Installing Navicat Premium...
#brew cask install navicat-premium  <-- checksum is failing

echo Installing Navicat Premium...
wget http://download.navicat.com/download/navicat112_premium_en.dmg

echo Converting DMG to CDR to bypass EULA...
hdiutil convert -quiet navicat112_premium_en.dmg -format UDTO -o Navicat\ Premium
rm navicat112_premium_en.dmg

echo Mounting CDR...
hdiutil attach -quiet -noautoopen Navicat\ Premium.cdr

echo Installing Navicat Premium...
sudo cp -r /Volumes/Navicat\ Premium/Navicat\ Premium.app ~/Applications

echo Cleaning up...
${UTILFILES}/detach-dmg.sh "Navicat Premium"

rm Navicat\ Premium.cdr

