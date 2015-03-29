#!/bin/bash

#****************************************************************************
# start.sh
# 
# This script is a shortcut for stopping ipbeacon via launchctl (on OS X). 
# Requires sudo because ipbeacon.py is owned and run by the root user at 
# system boot (allowing it to function with no users logged in).
#
# Author: npoles
# Date: March 29, 2015
# Last edited: March 29, 2015
# 
# Preconditions:
#   1. ipbeacon has been appropriately configured, installed, and started
#****************************************************************************

echo "Stopping IP Beacon."

sudo launchctl stop com.nickpoles.ipbeacon
sudo launchctl unload /Library/LaunchDaemons/com.nickpoles.ipbeacon.plist

echo "Stopped."
