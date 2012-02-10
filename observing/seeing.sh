#!/bin/bash
###############################################
# Mendez's Seeing Script
#  [2010-03-20] - Version 1: Written by Mendez
###############################################
# seeing.sh [nseconds]
#   pulls down the DIMM seeing from the Hawaii Website every nseconds, 60 if not
#   specified, States it and prints it to the terminal.  Kill with crtl-C.
# 
#   Requires:{say, pyline.py}
#
#   TODO:  Fix HTML Parsing to something better than it is currently.
#   TODO:  COLORS!
###############################################
CURRENT=""
LAST=""
COUNTER=0
if [ -z "$1" ]; then
    INTERVAL=60
else
    INTERVAL=$1
fi
echo "Mendez's Seeing Script" 
while [ $COUNTER -lt 100000 ]; do # could replace with true, but zombie protection is good.
    CURRENT="`curl -s http://hokukea.soest.hawaii.edu/current/seeing/ | grep DIMM| head -n 1|pyline "line.split('>')[6].split()[0]\"`"
    echo -e "\r`date +%H.%M.%S`:  Another $INTERVAL Seconds down. So far:$COUNTER  LAST: $CURRENT[$LAST]"
    if [ "$LAST" != "$CURRENT" ]; then
        # say $CURRENT
        LAST=$CURRENT
    fi
    for (( i=$INTERVAL; i>0; i-- ))
	do
		echo -ne "\r                "
		echo -ne "\r  $i... "
		sleep 1
	done
    let COUNTER=COUNTER+1
done
