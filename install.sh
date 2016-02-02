#!/usr/bin/env bash
#
#
echo NOT FULLY TESTED
exit

cd ~/.dotfiles

echo "Running .dotfiles/install.sh..."

for INSTALLER in ${INSTALLFILES}/*.sh; do

	#remove filepath and .sh extension
	BASENAME=$(basename -s .sh $INSTALLER)

  	echo "Processing exports/${BASENAME}.sh file..";
  	INSTALL_VAR=$(${UTILFILES}/to-upper.sh "${BASENAME}")

  	INSTALL_FILE="${INSTALLFILES}/${BASENAME}.sh"
  	chmod +x "${INSTALL_FILE}"
  	source "${INSTALL_FILE}"

  	echo

done