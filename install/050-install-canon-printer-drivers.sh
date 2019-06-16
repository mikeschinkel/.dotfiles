#!/usr/bin/env bash
#
# See:
#	
#	- http://www.canon.ca/inetCA/en/serviceDetail?directLink=Y&mid=4838B007&type=D
#	- http://hints.macworld.com/article.php?story=20061203221317612
#	- http://dae.me/blog/1826/add-a-printer-via-command-line-in-os-x/
#	- https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/lpadmin.8.html
#   - networksetup -listallhardwareports
#
basename="mac-mf-v10111-00"
filename="${basename}.dmg"

echo "Installing Canon Printer Drivers..."
#wget http://support.apple.com/downloads/DL1742/en_US/canonprinterdrivers3.3.dmg
wget "http://gdlp01.c-wss.com/gds/1/0100009331/06/${filename}"
echo 


echo "Mounting DMG..."
#hdiutil attach canonprinterdrivers3.3.dmg
hdiutil attach "${filename}"
echo 


echo "Installing Canon Printer Drivers..."
#sudo installer -package "/Volumes/Canon Inkjet Printer Drivers/CanonPrinterDrivers.pkg" -target /
sudo installer -package "/Volumes/${basename}/MF_Printer_Installer.pkg" -target /
echo


echo "Set Display Ethernet to 192.168.2.1 with subnet mask of 255.255.255.0..."
networksetup -setmanual "Display Ethernet" "192.168.2.1" "255.255.255.0" ""
networksetup -setnetworkserviceenabled "Display Ethernet" on
echo 

echo Cleaning up...
detach-dmg "${basename}"

rm "${filename}"
echo

echo "Adding Canon Printer Drivers..."

echo "THE FOLLOWING DOES NOT ACTUALLY WORK.  MUST ADD PRINTER MANUALLY."
exit

lpadmin -E -p "canon-mf5950dw" -D "Canon MF5950dw" -v "lpd:192.168.2.2" -P "/Library/Printers/PPDs/Contents/Resources/CNPZBMF5900ZB.ppd.gz" -o printer-is-shared=false
cupsenable canon-mf5950dw
cupsaccept canon-mf5950dw
cupsctl WebInterface=yes
open http://localhost:631/printers/
echo


