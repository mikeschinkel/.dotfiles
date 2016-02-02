#!/usr/bin/env bash
#
#  Backup the Indev files listed here into an Indev.zip file:
#
#		http://support.indev.ca/kb/mao-advanced-techniques/manually-moving-act-on-files-to-a-new-computer
#

SAVE_DIR=$(pwd)

if [ -d "Indev" ]; then 
	echo
	echo "   FAIL: ${SAVE_DIR}/Indev exists. Cannot continue."
	exit
fi 

if [ -f "Indev.zip" ]; then 
	echo "   FAIL: ${SAVE_DIR}/Indev.zip exists. Cannot continue."
	exit
fi 

mkdir Indev
mkdir Indev/Library
DIRS="Mail
Mail/Indev
Mail/V2
Mail/V2/MailData
Containers
Containers/com.apple.mail
Containers/com.apple.mail/Data
Containers/com.apple.mail/Data/Library
Containers/com.apple.mail/Data/Library/Preferences"
for DIR in $DIRS; do
	mkdir "Indev/Library/${DIR}" 2>/dev/null
done


DIR1="Library/Mail/Indev"
FILES1="OutboxRules.plist
ActOnRules.plist
ActOnTemplates.plist
MAOInboxRules.plist
MAOPreferredMailboxes.plist"

DIR2="Library/Mail/V2/MailData"
FILES2="RulesActiveState.plist
SyncedFilesInfo.plist
SyncedRules.plist
UnsyncedRules.plist"

DIR3="Library/Containers/com.apple.mail/Data/Library/Preferences"
FILES3="ca.indev.MailActOn.plist"

for NUM in 1 2 3; do 
	
	DIRVAR="DIR${NUM}"
	DIR=${!DIRVAR}
	FILESNAME="FILES${NUM}"

	for FILE in ${!FILESNAME}; do
		FROM_FILE="${HOME}/${DIR}/${FILE}"
		TO_FILE="${SAVE_DIR}/Indev/${DIR}/${FILE}"
		cp $FROM_FILE $TO_FILE 2>/dev/null
	done

done

find Indev ! -name '.DS_Store' | zip -@ Indev.zip

rm -Rf Indev

cd "${SAVE_DIR}"



