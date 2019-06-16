#!/usr/bin/env bash
#
# Latest PsySh
#
# See psysh.org
#

clear
echo Installing psysh...
echo

cd /tmp
wget https://psysh.org/psysh
chmod +x psysh
mv psysh /usr/local/bin
echo
