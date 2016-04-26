#!/usr/bin/env bash
dir=$(pwd)
cd /tmp
curl -O http://pear.php.net/go-pear.phar
rm expect.pear
echo #!/usr/bin/echo expect -f                        > expect.pear
echo spawn sudo php -d detect_unicode=0 go-pear.phar >> expect.pear
echo expect \"continue:\"                            >> expect.pear
echo send \"1\\r\"                                   >> expect.pear
echo expect \"] : \"                                 >> expect.pear
echo send \"/usr/local/pear\\r\"                     >> expect.pear
echo expect \"continue: \"                           >> expect.pear
echo send \"2\\r\"                                   >> expect.pear
echo expect \"] : \"                                 >> expect.pear
echo send \"/tmp\\r\"                                >> expect.pear
echo expect \"continue: \"                           >> expect.pear
echo send \"3\\r\"                                   >> expect.pear
echo expect \"] : \"                                 >> expect.pear
echo send \"/tmp\\r\"                                >> expect.pear
echo expect \"continue: \"                           >> expect.pear
echo send \"4\\r\"                                   >> expect.pear
echo expect \"] : \"                                 >> expect.pear
echo send \"/usr/local/bin\\r\"                      >> expect.pear
echo expect \"continue: \"                           >> expect.pear
echo send \"\\r\"                                    >> expect.pear
echo expect \"] : \"                                 >> expect.pear
expect expect.pear
rm expect.pear
cd ${pwd}
