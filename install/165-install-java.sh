#!/usr/bin/env bash

echo Installing Java...
wget http://support.apple.com/downloads/DL1572/en_US/javaforosx.dmg

echo Mounting DMG...
hdiutil attach javaforosx.dmg

echo Installing Java for OSX...
PACKAGE=$(ls /Volumes | grep "Java")
sudo installer -package "/Volumes/${PACKAGE}/JavaForOSX.pkg" -target /

new-export.sh JAVA_HOME "\$(/usr/libexec/java_home)"

echo Cleaning up...
detach-dmg Java

rm javaforosx.dmg