#!/usr/bin/env bash
#
# See: 
#	- https://kb.iu.edu/d/awio
#	- https://gpgtools.org
#	- https://github.com/GPGTools
#

echo Installing GPG Tools...
brew cask install gpgtools

new-path MacGPG2 "/usr/local/MacGPG2/bin"