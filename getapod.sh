#!/bin/bash
# Simple Script to download and load the NASA APOD photo as the wallpaper
# Load as cronjob with 0 10 * * * DISPLAY=:0.0 /home/john/scripts/getapod.sh (note the DISPLAY=:0.0)

DATE='/bin/date +%y%m%d' 
wget http://antwrp.gsfc.nasa.gov/apod/ap`$DATE`.html -O- 2> /dev/null |
grep -m 1 jpg | 
sed -e 's/<//' -e 's/>//' -e 's/.*=//' -e 's/"//g' -e 's/^/http:\/\/antwrp.gsfc.nasa.gov\/apod\//' |
wget -i- -O ~/images/wallpapers/apod-`$DATE`.jpg
nitrogen --set-zoom-fill ~/images/wallpapers/apod-`$DATE`.jpg
