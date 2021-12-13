#!/bin/bash

arr=()
iter=0

while true
do
	let iter=iter+1
	arr+=(0 1 2 3 4 5 6 7 8 9)
	if [ "${#arr[@]}" -ge "$1" ]
	then
		echo "Execution was successful!"
		exit 0
	fi
done
