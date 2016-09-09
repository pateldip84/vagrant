#!/bin/bash

#disable IPTABLES
chkconfig iptables off
service iptables stop
chkconfig ip6tables off
service ip6tables stop

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
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/pateldip84/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/pateldip84/vagrant/master/files/info.php

service httpd restart
