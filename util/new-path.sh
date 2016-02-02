#!/usr/bin/env bash

PATH_SLUG=$(${UTILFILES}/to-lower.sh "$1")
${UTILFILES}/new-script.sh paths/${PATH_SLUG} "echo \"$2\""
chmod +x "${PATHFILES}/$1.sh"
PATH="${PATH_VALUE}:${PATH}"
echo "  PATH ADDED: $2"
echo
