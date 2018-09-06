#!/bin/bash


# Helpers


# Params:
# $1: ignore filename
# $2: string to compare
#
# Returns:
# 1 true
# 0 false
function should_ignore {
	if [[ -z $(grep "^$2$" $1) ]]
	then
		return 0
	else
		return 1
	fi
}

## Dots

dot_path="./dots"
dot_files=$(ls -a $dot_path)
dot_ignore="$dot_path/ignore"

for file in $dot_files
do
	should_ignore $dot_ignore $file
	res=$?

	if [[ $res -eq 0 ]]
	then
		echo $file
	fi
done


## Scripts
