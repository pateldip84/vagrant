#!/bin/bash

#disable IPTABLES
chkconfig iptables off
service iptables stop
chkconfig ip6tables off
service ip6tables stop

#update cent os
yum update -y --exclude=kernel

#install tools
yum install -y nano git unzip screen nc telnet
