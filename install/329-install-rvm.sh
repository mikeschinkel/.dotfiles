#!/usr/bin/env bash
#
# See: 
#

echo Installing rvm...

save_dir=$(pwd)
cd /tmp

# Install mpapis public key (might need `gpg2` and or `sudo`)
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Download the installer
\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

# Verify the installer signature (might need `gpg2`), and if it validates...
gpg --verify rvm-installer.asc &&

# Run the installer
bash rvm-installer stable  --ruby

cd "${save_dir}"

