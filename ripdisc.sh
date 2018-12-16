#!/bin/bash
## Add to system autorun settings for command to launch when a CD is inserted.
## /path/to/file/ripdisk.sh %d
## Place .abcde.conf in user home directory
#######

CD=/dev/`echo $1|sed -e "s/.*\(sr[0-9]\).*/\\1/"`
#echo "$CD"
gnome-terminal -e "abcde -N -d //$CD"
