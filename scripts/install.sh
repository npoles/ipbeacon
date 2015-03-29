#!/bin/bash

#****************************************************************************
# install.sh
#
# Author: npoles
# Date: March 25, 2015
# Last edited: March 29, 2015
#
# This script moves all necessary ipbeacon files into place. These files 
# include ipbeacon.py, ipbeacon.conf, and com.nickpoles.ipbeacon.plist. If
# a necessary directory is not present, it will be created. A log file is also
# created at /var/log/ipbeacon.log in case debugging is necessary. 
#
# ipbeacon.py (and ipbeacon.conf) is placed at /usr/local/libexec per Apple's
# "Creating Launch Daemons and Agents" documentation which can be found here:
# https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html#//apple_ref/doc/uid/10000172i-SW7-BCIEDDBJ 
#
# I'm more than open to suggestions about config file placement as libexec
# doesn't feel like the correct place for that file to live. 
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
sudo chmod 700 /usr/local/libexec/ipbeacon.py
sudo chmod 400 /usr/local/libexec/ipbeacon.conf


echo "Creating log file at /var/log/ipbeacon.log..."
sudo touch /var/log/ipbeacon.log
sudo chmod 640 /var/log/ipbeacon.log


echo "Done."
echo
echo -n "You may now start and stop IP Beacon by using the start & stop scripts "
echo "or by rebooting your system."
echo

