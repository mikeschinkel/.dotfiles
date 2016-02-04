#!/usr/bin/env bash
#
# See:
#	- https://gist.github.com/avalonalex/8125197
# 	- https://discussions.apple.com/message/10061019#10061019
#

echo Installing Consolas Font...

brew install cabextract
cd /tmp
curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
cabextract PowerPointViewer.exe
cabextract ppviewer.cab

echo Click [INSTALL] in Font Book to install Consolas font.
source pause.sh "Press any key to open Font Book..."
open CONSOLA*.TTF  
