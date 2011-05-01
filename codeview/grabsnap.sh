#!/bin/bash
## GrabSnap -- An automated screenshot and osx iSight imaging tool
##   Requires isightcapture in the path
## [2011.04.11] 



PICTURE_DIR="$HOME/Pictures/grabsnap"
PICTURE_DATE=$(date +%Y-%m-%d_%H.%M.%S)

if [ ! -d $myimg ]; then
 mkdir "$myimg"
fi


COUNTER=0
if [ -z "$1" ]; then
    INTERVAL=60
else
    INTERVAL=$1
fi


echo -e "Capture Script Running every $INTERVAL seconds: " 
while [ $COUNTER -lt 100000 ]; do # could replace with true, but zombie protection is good.
	isightcapture -t png "$PICTURE_DIR/SNAP_$PICTURE_DATE"
	screencapture -T 0 -x "$PICTURE_DIR/DESK_$PICTURE_DATE.png"
	echo -e "\r $PICTURE_DATE:  Another $INTERVAL Seconds down. So far:$COUNTER"
	
	for (( i=$INTERVAL; i>0; i-- )); do
		echo -ne "\r                "
		echo -ne "\r  $i... "
		sleep 1
	done
    let COUNTER=COUNTER+1
done
