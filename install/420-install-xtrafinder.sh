#!/usr/bin/env bash

echo Installing XtraFinder...
brew cask install xtrafinder
echo "You MUST disable System Integrity Protection"
pause.sh "Press any key to read HOW TO..."
open "https://www.trankynam.com/xtrafinder/sip.html"