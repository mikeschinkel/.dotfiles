#!/bin/bash
#

echo "Updating Brew..."

BREW_STATUS=$(brew update)

if [ "${BREW_STATUS}" == "Already up-to-date." ]; then
	echo "Done."
else
	echo $BREW_STATUS
fi
echo
