#!/usr/bin/env bash
#
#  Restore the Indev files listed here from an Indev.zip file:
#
#		http://support.indev.ca/kb/mao-advanced-techniques/manually-moving-act-on-files-to-a-new-computer
#

SAVE_DIR=$(pwd)

if [ -d "Indev" ]; then 
	echo
	echo "   FAIL: ${SAVE_DIR}/Indev/ exist.  Cannot continue."
	exit;
fi 

if [ ! -f "Indev.zip" ]; then 
	echo
	echo "   FAIL: ${SAVE_DIR}/Indev.zip does not exist.  Cannot continue."
	exit;
fi 

ZIP_LOG=$(unzip -o Indev.zip)
cd Indev

echo
for FILE in $(find . -type f); do
	FILE="${FILE:2}"
	FULLPATH="${HOME}/${FILE}"
	if [ -f "${FULLPATH}" ]; then 
		NOTE="OVER"
	else		
		NOTE="  TO"
	fi
	echo "COPYING: ${FILE}"
	echo "   ${NOTE}: ${FULLPATH}..."
	echo
	cp "${FILE}" "${FULLPATH}"
done

cd ..
rm -Rf Indev


cd "${SAVE_DIR}"
