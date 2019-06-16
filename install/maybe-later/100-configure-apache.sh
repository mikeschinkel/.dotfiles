#!/usr/bin/env bash
#
echo DO NOT INSTALL Apache
exit

echo Configuring Apache...
sudo apachectl stop 2>/dev/null

mkdir -p ~/Apache
mkdir -p ~/Apache/www
mkdir -p ~/Apache/logs

echo "index.html is here!" > ~/Apache/www/index.html
echo "<?php" > ~/Apache/www/index.php
echo 'echo "index.php is here!";' >> ~/Apache/www/index.php


current_user=$(whoami)
email_address=$(personal-email)
httpd_conf="/private/etc/apache2/httpd.conf"
apache_domain=$(config .apache.domain)

sudo sed -i.bak "s/User _www/User ${current_user}/" "${httpd_conf}"
sudo sed -i.bak "s/Group _www/Group everyone/" "${httpd_conf}"
sudo sed -i.bak "s/ServerAdmin you@example.com/ServerAdmin ${email_address}/" "${httpd_conf}"
sudo sed -i.bak "s/ServerAdmin you@example.com/ServerAdmin ${email_address}/" "${httpd_conf}"
sudo sed -i.bak "s#^ErrorLog \"/private/var/log/apache2#ErrorLog \"${HOME}/Apache/logs#" "${httpd_conf}"
sudo sed -i.bak "s/DirectoryIndex index.html/DirectoryIndex index.php index.html/" "${httpd_conf}"
sudo sed -i.bak "s/#ServerName www.example.com:80/ServerName ${apache_domain}:80/" "${httpd_conf}"
sudo sed -i.bak "s#/Library/WebServer/Documents#${HOME}/Apache/www#g" "${httpd_conf}"
sudo sed -i.bak "s/LogLevel warn/LogLevel debug/" "${httpd_conf}"
sudo sed -i.bak "s#CustomLog \"/private/var/log/apache2#CustomLog \"${HOME}/Apache/logs#" "${httpd_conf}"
sudo sed -i.bak "s/#LoadModule php5_module/LoadModule php5_module/" "${httpd_conf}"

sudo apachectl start


