#!/usr/bin/env bash
#
# PHP versions installed in /usr/local/opt
#
# See: 
#		https://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions
#
exit DO NOT INSTALL PHP
exit

clear
echo Installing PHP...
echo

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

switch-php "5.3" "unlink"
switch-php "5.4" "unlink"
switch-php "5.5" "unlink"
switch-php "5.6" "unlink"
switch-php "7.0"

