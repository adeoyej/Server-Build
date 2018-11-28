#!/bin/bash
. ./Baseinstall/Baseinstall.sh
yum install -y httpd
service httpd start
chkconfig httpd on
