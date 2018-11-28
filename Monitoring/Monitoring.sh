#!/bin/bash
. ./Baseinstall/Baseinstall.sh
#installing depencies 
yum install gd gd-devel gcc glibc glibc-common wget
#creating user and password 
useradd -m nagios
passwd nagios
#creating a group
groupadd nagcmd
#adding nagios and apache to group
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache
#getting file
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.0.8.tar.gz
wget http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz
#s\extracting file
tar xzf nagios-4.0.8.tar.gz
#changing directory
cd nagios-4.0.8
#installs nagios and dependencies 
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode
make install-webconf
#extracts nagios plugins
tar xzf nagios-plugins-2.0.3.tar.gz
#change directory to nagios-plugins-2.0.3
cd nagios-plugins-2.0.3
#nagios configuration and (installing nagios plugins)
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
#Restart httpd service
systemctl restart httpd
#Add the path to the PATH variable and export the PATH
export PATH=/usr/local:$PATH
#Start the nagios service
systemctl start nagios
#Enable nagios to start on boot
chkconfig --add nagios
chkconfig nagios on
setenforce 0

