#!/usr/bin/env bash

#
# See:
#    https://getcomposer.org/download/
#

clear
echo Installing Composer for PHP...

php -r "readfile('http://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '781c98992e23d4a5ce559daf0170f8a9b3b91331ddc4a3fa9f7d42b6d981513cdc1411730112495fbf9d59cffbf20fb2') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
echo 
php composer-setup.php
php -r "unlink('composer-setup.php');"
echo 

echo "Ingore the OpenSSL library (0.9.8zc) warning."
echo "Composer installed corrrectly despite the warning."
pause.sh "Press any key to continue..."
echo 

echo Moving Composer to /usr/local/bin/...
sudo mkdir -p /usr/local/bin
sudo mv composer.phar /usr/local/bin/composer
echo

echo "Composer moved."
echo "Next, running Composer to test its install."
pause.sh "Press any key to continue..."
composer
