#!/bin/bash
echo "Please Input Title"
read TitleName
echo "Please Input Your Domain"
read DomainUrl

apt update
apt -y upgrade
apt -y install nginx php5-common php5-fpm
mkdir -p /usr/share/www/speedtest/
chmod 777 /var/run/php5-fpm.sock
cd /usr/share/www/speedtest/
wget https://github.com/lzcykevin/getspeedtest/raw/master/speed.tar.gz
tar -xvzf speed.tar.gz
tar -xvzf speedtest.tar.gz
sed -i "s/HTML5 Speedtest/$TitleName/" index.html
sed -i "s/xxxxxx/$DomainUrl/"  speedtest.conf
mv speedtest.conf /etc/nginx/conf.d/
rm -rf speed.tar.gz
rm -rf speedtest.tar.gz
chmod 777 /usr/share/www/speedtest/
nginx -s reload 
clear
