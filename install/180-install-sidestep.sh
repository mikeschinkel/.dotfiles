#!/usr/bin/env bash
#
# See:
#	- http://stratumsecurity.com/2010/12/03/shearing-firesheep-with-the-cloud/
#	- http://ubuntuhandbook.org/index.php/2014/04/change-hostname-ubuntu1404/

echo Installing SideStep...
brew cask install sidestep

echo "This assumes you have an Amazon EC2 instance running."
echo "Create and Download a Key/Pair file: ForSideStep.pem."
pause.sh "Press any key when ready..."

open "https://console.aws.amazon.com/ec2/home#KeyPairs:sort=keyName"
mv ~/Downloads/ForSideStep.pem ~/.ssh/
chmod 400 ~/.ssh/ForSideStep.pem ~/.ssh/

chmod +x new-export.sh
new-export.sh AWS_ACCESS_KEY "\$(get-secret.sh .aws.sidestep.access_key)"
new-export.sh AWS_SECRET_KEY "\$(get-secret.sh .aws.sidestep.secret_key)"
