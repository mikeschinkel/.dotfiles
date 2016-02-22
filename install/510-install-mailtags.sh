#!/usr/bin/env bash

echo Installing MailTags...
wget http://media.indev.ca/releases/MailTags4Current.dmg

echo Mounting DMG...
hdiutil attach MailTags4Current.dmg

echo Running MailTags Installer...
open "/Volumes/Install MailTags 4/Install MailTags 4.app"
pause.sh "Press any key AFTER you have installed Mail Tags..."

if [ -f ~/Library/Mail/Indev/MailTags4Data.db ]; then
	echo "Fixing ability to find MailTags Library..."
	# See http://support.indev.ca/discussions/questions/4221-mailtag-cannot-find-library
	mv ~/Library/Mail/Indev/MailTags4Data.db ~/Library/Mail/Indev/MailTags4Data.db.bak
fi

echo Cleaning up...
detach-dmg.sh "Install MailTags"

rm MailTags4Current.dmg



