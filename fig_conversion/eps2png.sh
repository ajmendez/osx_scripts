#!/bin/bash
# eps2png.sh figures/
echo 'Working on: ' $1
for file in $(ls $1*.eps); do
    echo $file
    # convert -density 200 $file -flatten ${file%\.*}.png
    convert -density 120 $file -flatten ${file%\.*}.png
done