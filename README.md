IP Beacon
=========

IP Beacon is a program designed to resolve the potential problem of ISPs 
dynamically changing your IP address. Most ISPs reserve the right to change
your IP address randomly and provide static IP addresses as an additional 
cost. If you do any sort of remote login or run a web server from your home
Internet connection, you need your IP address to remain static. If it does 
not, then you could suddenly lose access. IP Beacon is a simple tool that 
monitors your IP address every 5 minutes (via [icanhazip.com](http://icanhazip.com/)) 
and notifies you when it changes. At this point in time, it doesn't update 
anything (such as DNS records) for you, but it will at least make you aware 
of an IP address change. Additionally, you won't have to pay your ISP to 
maintain a static IP address.

_I tried to make this code as complete as possible, however, it is still very 
new and, as such, will have bugs._    
_Please feel free to submit changes and/or suggestions._

### Requirements
* Python 2.7
* IP Beacon was designed for OS X machines (and relies on launchd). It may run on
  a one-off basis on Linux machines but the scheduling definitely will not work. 
* You should maintain the structure of the program, especially the config and 
  scripts directories. 
* Scripts must be run from the scripts directory. 

### To Run IP Beacon
1. Clone this repository
2. Run scripts/genconfig.py
3. Run scripts/install.sh
4. Run scripts/start.sh


### Program Structure

~~~~
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
~~~~

### Additional Ideas
* Instead of sending the alert to an actual email inbox, I've written my config
  file to send me a text message. 
    * This [GitHub repo](https://github.com/CrakeNotSnowman/Python_Message/blob/master/sendMessage.py#L106)
      was a big help in figuring this out. 
* This code should be easily modifiable to fit a UNIX/Linux system. In fact, only
  the automation/launchd configuration should need to be changed.

###Helpful Resources
* [Python smtplib Docs](https://docs.python.org/2/library/smtplib.html)
* [Python urllib Docs](https://docs.python.org/2/library/urllib.html)
* [Python json Docs](https://docs.python.org/2/library/json.html)
* [Apple's "Creating Launch Daemons and Agents" Doc](https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html#//apple_ref/doc/uid/10000172i-SW7-BCIEDDBJ)
* [Apple's launchd.plist Man Page](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man5/launchd.plist.5.html#//apple_ref/doc/man/5/launchd.plist)
