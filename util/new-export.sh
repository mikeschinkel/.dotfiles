#!/usr/bin/env bash

EXPORT_FILE=$(${UTILFILES}/to-lower.sh "$1")
${UTILFILES}/new-script.sh exports/${EXPORT_FILE} "echo \"$2\""
${UTILFILES}/export-var.sh ${EXPORT_FILE}
