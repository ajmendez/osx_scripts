#!/bin/bash
## GrabSnap -- An automated screenshot and osx iSight imaging tool
##   Requires isightcapture in the path
##   grabsnap.sh [name] [interval in seconds] [number of monitors]
## [2011.04.11] 


INTERVAL=60
PICTURE_DIR="$HOME/Pictures/grabsnap"
MONITORS=1

if [ ! -z "$1" ]; then 
	PICTURE_DIR="$PICTURE_DIR/$1"
fi

if [ ! -d "$PICTURE_DIR" ]; then
	echo "making $PICTURE_DIR"
 	mkdir -p "$PICTURE_DIR"
fi

if [ ! -z "$2" ]; then
    INTERVAL=$2
fi

if [ ! -z "$3" ]; then
	MONITORS=$3
fi


echo -e "Capture Script Running every $INTERVAL seconds: "
COUNTER=0
while [ $COUNTER -lt 100000 ]; do # could replace with true, but zombie protection is good.
	PICTURE_DATE=$(date +%Y-%m-%d_%H.%M.%S)
	isightcapture -t png "$PICTURE_DIR/SNAP_$PICTURE_DATE.png"
	
	for (( c=0; c<=$MONITORS; c++ )); do 
		FILES[$c]="$PICTURE_DIR/DESK-${c}_$PICTURE_DATE.png"
	done
	screencapture -C -T 0 -x ${FILES[@]}
	sips --resampleWidth 960 ${FILES[@]} >>/dev/null 2>&1
	
	echo -e "\r $PICTURE_DATE:  Another $INTERVAL Seconds down. So far:$COUNTER"
	
	for (( i=$INTERVAL; i>0; i-- )); do
		echo -ne "\r                "
		echo -ne "\r  $i... "
		sleep 1
	done
    let COUNTER=COUNTER+1
done
