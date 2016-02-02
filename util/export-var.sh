#!/usr/bin/env bash

EXPORT_FILE=$(${UTILFILES}/to-lower.sh "$1")
EXPORT_VAR=$(${UTILFILES}/to-upper.sh "$1")
echo Exporting ${EXPORT_VAR}...

chmod +x ${EXPORTFILES}/${EXPORT_FILE}.sh
EXPORT_VALUE="$(${EXPORTFILES}/${EXPORT_FILE}.sh)"
export ${EXPORT_VAR}="${EXPORT_VALUE}"
echo "  EXPORTED: ${EXPORT_VAR}=${EXPORT_VALUE}"
echo
