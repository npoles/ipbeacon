#!/bin/bash

echo "Stopping IP Beacon."

sudo launchctl stop com.nickpoles.ipbeacon
sudo launchctl unload /Library/LaunchDaemons/com.nickpoles.ipbeacon.plist

echo "Stopped."
