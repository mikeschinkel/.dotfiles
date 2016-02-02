#!/bin/bash
#
# Sets paths.
# For Default Paths see: http://stackoverflow.com/a/9832813/102699
#

echo "Running .dotfiles/bash_paths.sh..."

add_path() {
    if [[ $PATH != *"$1"* ]]; then
		    #echo "  Adding Path $1..."
        PATH="$1:${PATH}"
    fi
}

add_path "/usr/local/bin"
add_path "/usr/local/sbin"
add_path "/opt/local/bin"
add_path "/opt/local/sbin"

for PATHER in ${PATHFILES}/*.sh; do

    #remove filepath and .sh extension
    BASENAME=$(basename -s .sh $PATHER)

    #echo "    Processing paths/${BASENAME}.sh file..";

    chmod +x "${PATHFILES}/${BASENAME}.sh"
    PATH_VALUE=$("${PATHFILES}/${BASENAME}.sh")
    add_path "${PATH_VALUE}"

done

echo
echo "  PATH:"
for DIR in $(echo "${PATH}" | tr ":" "\n")
do
    echo "    ${DIR}"
done
echo

