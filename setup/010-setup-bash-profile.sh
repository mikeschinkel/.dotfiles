#!/usr/bin/env bash

echo Setting up BASH Profile
echo
sudo echo '#!/usr/bin/env bash' > ~/.bash_profile
sudo echo 'cd ~/.dotfiles && source ~/.dotfiles/bash_profile.sh && cd ~/' >> ~/.bash_profile
