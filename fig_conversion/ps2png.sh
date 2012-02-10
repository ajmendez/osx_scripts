#!/bin/bash
# ps2png.sh figures/
echo 'Working on: ' $1
for file in $(ls $1*.ps); do
    echo $file
    ps2pdf $file
    convert -density 120 ${file%\.*}.pdf ${file%\.*}.png
done