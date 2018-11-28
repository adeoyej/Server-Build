#!/bin/bash
. ./Baseinstall/Baseinstall.sh
#getting mysql repo
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
md5sum mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
#installing mysql-server
yum install mysql-server
#starting the mysql server
systemctl start mysqld
#chekcing the status
systemctl status mysqld
mysqladmin -u root -p version
