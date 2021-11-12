#!/bin/bash
#
# Sets paths.
# For Default Paths see: http://stackoverflow.com/a/9832813/102699
#

echo "Running .dotfiles/bash/020-paths.sh..."

add_path() {
    if [[ "$PATH" != *":$1:"* ]]; then
		#echo "  Adding Path $1..."
        PATH="${PATH}:$1"
    fi
}

# if [ "${DOTFILES_DIR}" == "" ]; then
#     #echo "  Adding Path $1..."
#     DOTFILES_DIR=$(dirname $(pwd))
# fi

add_path "${DOTFILES_DIR}/bin"
add_path "/usr/local/sbin"
add_path "/opt/local/bin"
add_path "/opt/local/sbin"

path_scripts="$(find "${DOTFILES_DIR}/paths/"*.sh | sort)"
for path_script in $path_scripts; do

    #echo "    Processing ${path_script} file..";

    chmod +x $path_script
    path_value="$(source "${path_script}")"
    add_path "${path_value}"

done

add_path "${DOTFILES_DIR}/backup"

printf "\n  PATH:\n\t%s\n\n" "${PATH//:/$'\n\t'}"

