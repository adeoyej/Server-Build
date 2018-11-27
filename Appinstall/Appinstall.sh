#!/bin/bash
#installing java jdk
yum -y install java-1.8.0-openjdk-devel
#installing dependencies
yum groupinstall -y "development tools" 
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel
# chaning directory to usr/src
cd /usr/src
#downloading the python file
wget http://python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
# extracting the file
tar xf Python-3.6.4.tar.xz
#changing directory 
cd Python-3.6.4
#enabling optimizations 
./configure --enable-optimizations
#installs python 3.6
make altinstall
exit
