#!/bin/bash
. ./Baseinstall
#install java jdk
yum -y install java-1.8.0-openjdk-devel
#installing cependencies 
yum groupinstall -y "development tools" 
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel
#changing directory
cd /usr/src
# getting python file then extracting file
wget http://python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar xf Python-3.6.4.tar.xz
#changing directory 
cd Python-3.6.4
#enabling python
./configure --enable-optimizations
make altinstall
exit
