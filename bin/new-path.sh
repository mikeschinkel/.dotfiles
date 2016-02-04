#!/usr/bin/env bash

PATH_SLUG=$(to-lower.sh "$1")
new-script.sh paths/${PATH_SLUG} "echo \"$2\""
chmod +x "${PATHFILES}/$1.sh"
PATH="${PATH_VALUE}:${PATH}"
echo "  PATH ADDED: $2"
echo
