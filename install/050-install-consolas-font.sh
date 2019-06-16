#!/usr/bin/env bash
#
# See:
#	- https://gist.github.com/avalonalex/8125197
# 	- https://discussions.apple.com/message/10061019#10061019
#

echo Installing Consolas Font...

cd /tmp
wget https://www.wfonts.com/download/data/2014/12/06/consolas/consolas.zip
unzip consolas.zip
echo Click [INSTALL] in Font Book to install Consolas font.
source pause "Press any key to open Font Book..."
open CONSOLA*.TTF  
rm CONSOLA*.*