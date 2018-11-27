#!/bin/bash
#installing apache
yum install -y httpd
#starting apache
service httpd start
#enables httpd 
chkconfig httpd on
