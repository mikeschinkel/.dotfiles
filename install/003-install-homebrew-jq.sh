#!/usr/bin/env bash
echo Installing HomeBrew...
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Updating HomeBrew...
brew update
echo 

echo Installing ./jq...
brew install jq


echo "Exporting HOMEBREW_GITHUB_API_TOKEN..."
new-export HOMEBREW_GITHUB_API_TOKEN "\$(get-secret .github.homebrew.access_token)"
echo 

echo Running Brew Doctor...
DIAGNOSIS=$(brew doctor)
if [ "$DIAGNOSIS" != "Your system is ready to brew." ]; then
	echo "-------------"
	echo "ERRORS FOUND!"
	echo "-------------"
	echo "${DIAGNOSIS}"
	pause "Press any key..."
fi	



