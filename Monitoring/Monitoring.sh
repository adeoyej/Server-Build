#!/bin/bash
yum install gd gd-devel gcc glibc glibc-common wget
useradd -m nagios
passwd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.0.8.tar.gz
wget http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz
tar xzf nagios-4.0.8.tar.gz
cd nagios-4.0.8
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode
make install-webconf
tar xzf nagios-plugins-2.0.3.tar.gz
cd nagios-plugins-2.0.3
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
systemctl restart httpd
export PATH=/usr/local:$PATH
systemctl start nagios
chkconfig --add nagios
chkconfig nagios on
setenforce 0

