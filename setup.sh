#!/usr/bin/env bash
#
# Setup for a new installed Mac OS X
#
# Eventually it will be almost fully complete.

echo NOT FULLY TESTED
exit
cd ~/.dotfiles

for FILE in setup/*.sh; do

	sudo chmod +x "${FILE}"
	source "${FILE}"

done

