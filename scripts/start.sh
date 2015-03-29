#!/bin/bash

echo "Starting IP Beacon"

sudo launchctl load /Library/LaunchDaemons/com.nickpoles.ipbeacon.plist
sudo launchctl start com.nickpoles.ipbeacon

echo "Started."
