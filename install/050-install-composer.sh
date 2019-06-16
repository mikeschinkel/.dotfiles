#!/usr/bin/env bash

#
# See:
#    https://getcomposer.org/download/
#

clear
echo Installing Composer for PHP...

cd /tmp
wget https://getcomposer.org/installer
mv installer composer-setup.php
hash="$(cat composer-setup.php| openssl dgst -sha384)"
valid="48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5"
if [ "${hash}" == "${valid}" ] ; then 
 	echo 'Installer verified'
else
	echo 'Installer corrupt'
	exit
fi
if [ "$(php -version)" == "-bash: php: command not found" ]; then 
	echo "PHP not installed"
	exit
fi
php composer-setup.php
rm "composer-setup.php"
echo 


echo "Ingore the OpenSSL library (0.9.8zc) warning."
echo "Composer installed corrrectly despite the warning."
pause "Press any key to continue..."
echo 

echo Moving Composer to /usr/local/bin/...
sudo mkdir -p /usr/local/bin
sudo mv composer.phar /usr/local/bin/composer
echo

echo "Composer moved."
echo "Next, running Composer to test its install."
pause "Press any key to continue..."
composer
