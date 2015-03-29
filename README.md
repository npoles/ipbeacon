IP Beacon
=========

IP Beacon is a program designed to resolve the potential problem of ISPs 
dynamically changing your IP address. Most ISPs reserve the right to change
your IP address randomly and provide static IP addresses as an additional 
cost. If you do any sort of remote login or run a web server from your home
Internet connection, you need your IP address to remain static. If it does 
not, then you could suddenly lose access. IP Beacon is a simple tool that 
monitors your IP address every 5 minutes and notifies you when it changes. 
At this point in time, it doesn't update anything (such as DNS records) for 
you, but it will at least make your aware of an IP address change. 
Additionally, you won't have to pay your ISP to maintain a static IP address.

Requirements
------------
* Python 2.7
* IP Beacon was designed for OS X machines (and relies on launchd). It may run on
  a one-off basis on Linux machines but the scheduling definitely will not work. 
* You should maintain the structure of the program, especially the config and 
  scripts directories. 
* Scripts must be run from the scripts directory. 

To Run IP Beacon
----------------
1. Clone this repository
2. Run scripts/genconfig.py
3. Run scripts/install.sh
4. Run scripts/start.sh


Program Structure
-----------------
    ipbeacon  
    |-- README.md                               - self-explanatory  
    |-- config  
    |      |-- com.nickpoles.ipbeacon.plist     - OS X launchd config  
    |-- scripts  
           |-- genconfig.py                     - generates config & pass file  
           |-- install.sh                       - moves ipbeacon.py & config into place
           |-- ipbeacon.py                      - IP Beacon main program
           |-- start.sh                         - quick way to start beacon
           |-- status.sh                        - quick way to check beacon
           |-- stop.sh                          - quick way to stop beacon

Additional Ideas
----------------
* Instead of sending the alert to an actual email inbox, I've written my config
  file to send me a text message. 
    * [This GitHub repo]
      (https://github.com/CrakeNotSnowman/Python_Message/blob/master/sendMessage.py#L106)
      was a big help in figuring this out. 

Notes
-----