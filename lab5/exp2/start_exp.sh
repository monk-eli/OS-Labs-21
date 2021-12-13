#!/bin/bash

for (( i=0; i<$2; i++ ))
do
	./newmem.sh $1 &
	sleep 1
done
