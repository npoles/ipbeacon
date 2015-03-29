#!/bin/bash

#****************************************************************************
# status.sh
# 
# This script is a shortcut for querying launchctl (on OS X) for the status
# of IP Beacon. Requires sudo because ipbeacon.py is run by the root user
# at system boot (allowing it to function with no users logged in).
#
# Author: npoles
# Date: March 29, 2015
# Last edited: March 29, 2015
# 
# Preconditions:
#   1. ipbeacon has been appropriately configured, installed, and started
#****************************************************************************

sudo launchctl list | grep com.nickpoles.ipbeacon