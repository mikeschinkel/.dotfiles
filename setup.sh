#!/usr/bin/env bash
#
# Setup for a new installed Mac OS X
#
# Eventually it will be almost fully complete.

cd ~/
sudo echo '#!/usr/bin/env bash' > ~/.bash_profile
sudo echo 'cd .dotfiles && source ~/.dotfiles/bash_profile && cd ~/' >> ~/.bash_profile
cd ~/.dotfiles
sudo chmod +x osx.sh
sudo ./setup-osx.sh
sudo chmod +x install.sh
sudo ./setup-install.sh