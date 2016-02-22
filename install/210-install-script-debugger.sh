#!/usr/bin/env bash
#
# See http://www.latenightsw.com/sd5/download-script-debugger/#
#

echo "Installing ScriptDebugger..."
echo

save_dir=$(pwd)
cd /tmp

dmg_file="ScriptDebugger5.0.10-685.dmg"

echo "Downloading ScriptDebugger..."
echo
wget "https://s3.amazonaws.com/latenightsw.com/${dmg_file}"
echo

echo "Converting ${dmg_file} to ScriptDebugger.cdr to bypass EULA..."
echo
hdiutil convert -quiet "${dmg_file}" -format UDTO -o ScriptDebugger.cdr
echo

echo "Mounting ScriptDebugger.cdr..."
echo
hdiutil attach -quiet -noautoopen ScriptDebugger.cdr
echo

echo "Copying Script Debugger.app to ~/Applications..." 
echo
cd ~/Applications
cp -r "/Volumes/Script Debugger 5.0.10/Script Debugger.app" .
echo

echo "Cleaning up..."
echo
detach-dmg.sh ScriptDebugger

cd "${save_dir}"
rm -Rf "/tmp/${dmg_file}"
echo 