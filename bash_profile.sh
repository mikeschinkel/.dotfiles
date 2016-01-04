#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."
source bash_prompt.sh
source bash_paths.sh
source bash_install.sh
echo "Bash initialization complete."

cd..() {
    cd ..
}
