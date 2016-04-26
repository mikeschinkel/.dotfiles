#!/usr/bin/env bash

echo Installing EC2 Command Line Tools...
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip

sudo mkdir /usr/local/ec2
sudo unzip -q -o ec2-api-tools.zip -d /usr/local/ec2
rm ec2-api-tools.zip

chmod +x "${DOTFILES_DIR}/bin/new-export"
new-export EC2_HOME "\$(find /usr/local/ec2 -maxdepth 1 -type d | grep ec2-api-tools)"

chmod +x "${DOTFILES_DIR}/bin/new-path"
new-path EC2_HOME "\${EC2_HOME}/bin"

