#!/bin/bash

> "log/report.log"

arr=()
iter=0

while true
do
	let iter=iter+1
	arr+=(0 1 2 3 4 5 6 7 8 9)
	if [ $((iter%100000)) -eq 0 ]
	then
		echo "${#arr[@]}" >> "log/report.log"
	fi
done
