#!/bin/bash

echo "starting the loop through"

[[ "${1}"x == x ]] && { echo "must provide argument" ; exit 1 ; }

for FILE in $(find $1 -type f -name '*.launch')
do
	out="$(basename $FILE)"
	echo $out
	roslaunch $FILE
done
