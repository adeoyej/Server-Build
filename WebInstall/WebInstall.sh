#!/bin/bash
yum install -y httpd
service httpd start
chkconfig httpd on
