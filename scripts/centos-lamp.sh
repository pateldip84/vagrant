#!/bin/bash

#update cent os
yum update -y --exclude=kernel

#install tools
yum install -y nano git unzip screen

#install Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#install php
yum install -y php php-devel php-cli php-mysql

#install Mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start

mysql -u root -e "SHOW DATABASES";

#DOWNLOAD starter content
service httpd restart
