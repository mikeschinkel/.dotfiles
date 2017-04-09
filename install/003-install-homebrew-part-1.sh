#!/usr/bin/env bash
echo Installing HomeBrew...
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Updating HomeBrew...
brew update

echo Running Brew Doctor...
DIAGNOSIS=$(brew doctor)
if [ "$DIAGNOSIS" != "Your system is ready to brew." ]; then
	echo "-------------"
	echo "ERRORS FOUND!"
	echo "-------------"
	echo "${DIAGNOSIS}"
	pause "Otherwise, press any key..."
	exit
fi	


