#!/bin/bash
## Teatime is a simple teatime script to calculate the number of minutes till the next teatime.  Add it to your path, and add teatime.sh to your .bashrc/.bash_profile.
## [Mendez 2012.03]
TEATIME=$((15*60))
HR=$(($(date +%H)*60+$(date +%M)))
if [[ "$HR" > "$TEATIME" ]]; then 
  echo $(($TEATIME+24*60-$HR)) Minutes till Tea Time...
else
  echo $(($TEATIME-$HR)) Minutes till Tea Time
fi