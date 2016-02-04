#!/usr/bin/env bash

EXPORT_FILE=$(to-lower.sh "$1")
new-script.sh exports/${EXPORT_FILE} "echo \"$2\""
export-var.sh ${EXPORT_FILE}
