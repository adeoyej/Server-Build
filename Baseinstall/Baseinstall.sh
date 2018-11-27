#!/bin/bash
#installing update
yum -y update
#adding a user called and password for AdminU1
adduser AdminU1
passwd AdminU1 
#adding user to sudoer file
echo 'AdminU1 ALL=(ALL:ALL) ALL' >> /etc/sudoers
#generating an ssh key 
ssh-keygen -f /home/AdminU1/.ssh

