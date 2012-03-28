#!/bin/bash

## Teatime is a simple teatime script to calculate the number of minutes till the next teatime.
teatime () {
  TEATIME=$((15*60))
  HR=$(($(date +%H)*60+$(date +%M)))
  if [[ "$HR" > "$TEATIME" ]]; then 
    echo $(($TEATIME+24*60-$HR)) Minutes till Tea Time...
  else
    echo $(($TEATIME-$HR)) Minutes till Tea Time
  fi
  exit 1;
}
teatime