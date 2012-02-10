#!/bin/bash
# eps2pdf.sh figures/
echo 'Working on: ' $1
for i in $(ls $1*.eps); do
    echo $i
    epstopdf $i; 
done