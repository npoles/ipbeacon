#!/bin/bash

#****************************************************************************
# status.sh
# 
# This script is a shortcut for querying launchctl (on OS X) for the status
# of IP Beacon. 
#
# Author: npoles
# Date: March 29, 2015
# Last edited: March 29, 2015
# 
# Preconditions:
#   1. ipbeacon has been appropriately configured, installed, and started
#****************************************************************************

sudo launchctl list | grep com.nickpoles.ipbeacon