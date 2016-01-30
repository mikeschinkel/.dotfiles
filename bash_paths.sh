#!/bin/bash
#
# Sets paths.
# For Default Paths see: http://stackoverflow.com/a/9832813/102699
#

echo "Running .dotfiles/bash_paths.sh..."

add_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:${PATH:+"$PATH:"}"
    fi
}

add_path "/usr/local/bin"
add_path "/usr/local/sbin"
add_path "/opt/local/bin"
add_path "/opt/local/sbin"
