#!/usr/bin/env bash
#
# Export vars.
#

echo "Running .dotfiles/bash_exports.sh..."

export DOTFILES="${HOME}/.dotfiles"
export CONFIGFILES="${DOTFILES}/config"
export UTILFILES="${DOTFILES}/util"
export EXPORTFILES="${DOTFILES}/exports"
export INSTALLFILES="${DOTFILES}/install"
export PATHFILES="${DOTFILES}/paths"

export GETSECRET="${UTILFILES}/get-secret.sh"

echo

for EXPORTER in ${EXPORTFILES}/*.sh; do

	#remove filepath and .sh extension
	BASENAME=$(basename -s .sh $EXPORTER)

  	#echo "Processing exports/${BASENAME}.sh file..";
  	EXPORT_VAR=$(${UTILFILES}/to-upper.sh "${BASENAME}")

  	chmod +x ${EXPORTFILES}/${BASENAME}.sh
  	EXPORT_FILE="${EXPORTFILES}/${BASENAME}.sh"
  	EXPORT_VALUE=$(${EXPORT_FILE})
  	export $EXPORT_VAR="${EXPORT_VALUE}"
  	echo "  Exported ${EXPORT_VAR}=${EXPORT_VALUE}"

done    
echo
