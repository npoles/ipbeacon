#!/usr/bin/python

import getpass
import json
import os
import subprocess

"""**************************************************************************
* genconfig.py
* 
* Author: npoles
* Date: March 29, 2015
* Last edited: March 29, 2015
* 
* Collects information required to run the program, stores it in a python
* dictionary and then writes the dictionary as a JSON file to 
* ipbeacon/config/ipbeacon.conf. 
* The program also collects and email account password which is written to
* a file separate from the config file (.beaconpass). This file is only ever
* placed in the user's home directory (~) and then has its ownership changed
* to the root user and wheel group (OS X) with 400 permissions. Theoretically
* this should limit control and viewing to users with root access. 
*
* Preconditions:
*   1. ipbeacon directory is in place and contains the config directory
* Postconditions:
*	1. conf/ipbeacon.conf has been created and .beaconpass is placed in
* 	   the user's home directory
**************************************************************************"""

def get_inputs(config):
	"""Prompts for inputs required for config file, ipbeacon.conf and stores them in config object.
	Password cannot be passed back by reference, so it is returned."""

	print "Please provide the requested information in order to genenrate ",
	print "your IP Beacon config file.\n"
	print "Your password will be placed in a hidden file owned by root with read-only permissions ",
	print "at ~/.beaconpass."
	print "If a .beaconpass file already exists in your home directory, it will be deleted."

	config['server'] = raw_input("\nOutgoing SMTP server address (e.g. smtp.gmail.com): ")
	config['port'] = raw_input("\nOutgoing SMTP server port (e.g. 465): ")

	config['username'] = raw_input("\nUser name for the designated SMTP server: ")
	password = getpass.getpass("\nPassword for the designated SMTP server & username: ")

	config['to'] = raw_input("\nThe email address where you would like alerts sent: ")

	#add path to .beaconpass and blank IP address and copy username to from-address
	config['password'] = os.path.expanduser("~") + "/.beaconpass"
	config['ipaddr'] = ""
	config['from'] = config['username']

	return password

def write_config(config):
	"""Write the config to a file in JSON format"""

	cfile = file('../config/ipbeacon.conf', 'w')
	json.dump(config, cfile)
	cfile.close()


def write_password(config, password):
	print "\nPlease enter your password to change permissions on your password file."

	#if ~/.beaconpass exists, delete it
	if os.path.exists(config['password']):
		subprocess.call(("sudo rm " + config['password']).split())

	#write password & change permissions
	pfile = file(config['password'], 'w')
	pfile.write(password)
	pfile.close()

	#make file read-only, make it owned by root, wheel (pwd used to get correct UID & GID ints)
	subprocess.call(("sudo chmod 400 " + config['password']).split())
	subprocess.call(("sudo chown root " + config['password']).split())
	subprocess.call(("sudo chgrp wheel " + config['password']).split())

	#destroy sudo timestamp
	subprocess.call("sudo -K".split())



if __name__ == "__main__":
	config = {}

	password = get_inputs(config)
	write_config(config)
	write_password(config, password)

	print "\nCongratulations! The configuration files for IP Beacon have been generated. ",
	print "Please run install.sh to complete installation.\n"

