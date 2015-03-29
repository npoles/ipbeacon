#!/usr/bin/python

import getpass
import urllib
import json
import smtplib
import os
from time import sleep
from socket import gethostname


"""**************************************************************************
* ipbeacon.py
* 
* Author: npoles
* Date: March 23, 2015
* Last edited: March 29, 2015
* 
* Python program responsible for checking dynamic IP addresses and notifying 
* the user of a change. Relies on ipbeacon.conf and .beaconpass. 
* Actions are as follows:
*   1. Read configuration file
*   2. Query icanhazip.com for current IP address
*   3. Compare config IP with queried IP
*   4. If a difference is noted, update config, email user. Else quit. 
* 
* Preconditions:
*   1. genconfig.py and install.sh, in order, have been successfully run
**************************************************************************"""

#allows us to put executable code up front
def main():
    """Main logic of the program. Get IP, compare IP, notify if different"""
    
    #load config file
    config_file = '/usr/local/libexec/ipbeacon.conf'
    config = json.load(file(config_file, 'r'))

    #get current IP address
    curr_ipaddr = urllib.urlopen("http://ipv4.icanhazip.com").read().strip()

    #if different, update config file and email, else do nothing
    if curr_ipaddr != config['ipaddr']:
        config['ipaddr'] = curr_ipaddr

        update_config(config_file, config)
        notify(config)

    sleep(15)           #prevent OS X from complaining about short runtime 
    quit()


def notify(config):
    """Uses SMTP and info in the 'config' object to send an 'email' to 
    notify the user of an IP address change"""

    #format the message
    msg = (gethostname() + "'s IP address has changed to: " + 
    config['ipaddr']  + "\n\nPlease plan accordingly.")

    #send text notification
    server = smtplib.SMTP_SSL(config['server'], int(config['port']))
    server.ehlo()
    server.login(config['username'], file(config['password'], 'r').read())
    server.sendmail(config['from'], config['to'], msg)
    server.quit()


def update_config(config_file, config):
    """Updates the IP address in the config file (ipbeacon.conf)
    by dumping the 'config' object out in JSON format"""
   
    out_file = file(config_file, 'w')
    out_file.truncate()
    
    json.dump(config, out_file)
    out_file.close()


#delegate executable code to main()
if __name__ == "__main__":
    main()