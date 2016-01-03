#!/bin/bash
#
echo "Running .bash_profile..."
source .bash_prompt
source .bash_paths
echo "Bash initialization complete."

cd..() {
    cd ..
}
