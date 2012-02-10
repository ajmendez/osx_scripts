#!/bin/bash
# eps2png.sh figures/
echo 'Working on: ' $1
for file in $(ls $1*.jpg); do
    echo $file
    # convert -format eps $file ${file%\.*}.eps
    jpeg2ps $file > ../new/${file%\.*}.eps
done