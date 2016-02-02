#!/usr/bin/env bash

sudo echo '#!/usr/bin/env bash' > ~/.bash_profile
sudo echo 'cd ~/.dotfiles && source ~/.dotfiles/bash_profile.sh && cd ~/' >> ~/.bash_profile
