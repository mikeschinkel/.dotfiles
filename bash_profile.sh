#!/bin/bash
#
echo "Running .dotfiles/bash_profile.sh..."
source bash_prompt.sh
source bash_paths.sh
echo "Bash initialization complete."

cd..() {
    cd ..
}
