#!/bin/bash

#****************************************************************************
# install.sh
# 
# FILL THIS OUT! 
# [DESCRIPTION]
#
# Author: npoles
# Date: March 25, 2015
# Last edited: March 25, 2015
# 
# Preconditions:
#   1. ipbeacon directory is in place and contains original files
#****************************************************************************

echo "Installing IP Beacon."
echo
echo -n "Please make sure you have properly modified your config file and "
echo -n "placed a file with your SMTP password in a location pointed to by "
echo -n "the config 'password' attribute. It is recommended that you secure "
echo "permissions on this password file "
echo
echo "Creating necessary directories..."
sudo mkdir /usr/local/libexec


echo "Moving files into place..."
sudo cp ../config/com.nickpoles.ipbeacon.plist /Library/LaunchDaemons/
sudo cp ../config/ipbeacon.conf /usr/local/libexec/
sudo cp ../scripts/ipbeacon.py /usr/local/libexec/


echo "Changing permissions..."
sudo chmod 755 /usr/local/libexec
sudo chmod 744 /usr/local/libexec/ipbeacon.py
sudo chmod 644 /usr/local/libexec/ipbeacon.conf


echo "Creating log file at /var/log/ipbeacon.log..."
sudo touch /var/log/ipbeacon.log
sudo chmod 640 /var/log/ipbeacon.log


echo "Done."
echo
echo -n "You may now start and stop IP Beacon by using the start & stop scripts "
echo "or by rebooting your system."
echo

