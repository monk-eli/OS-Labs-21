#!/bin/bash

> "log/top_5.log"
> "log/top_proc.log"
echo "PTime" > "log/top_mem.log"
echo "PTime" > "log/top_swap.log"

while true
do
	proc=$(top -b -n1 | grep "mem.sh" | head -n1)
	proc_state=$(echo "$proc" | awk '{print $8}')
	proc_time=$(echo "$proc" | awk '{print $11}')

	if [ -z proc ] || [ "$proc_state" != "R" ]
	then
		exit 0
	fi

	mem_usage=$(top -b -n1 | grep "MiB Mem")
	swap_usage=$(top -b -n1 | grep "MiB Swap")
	top_five=$(top -b -n1 | head -n12 | tail -n5)

	echo -e "$top_five\n" >> "log/top_5.log"
	echo "$proc_time  $mem_usage" >> "log/top_mem.log"
	echo "$proc_time  $swap_usage" >> "log/top_swap.log"
	echo "$proc_time  $proc" >> "log/top_proc.log"

	sleep 1
done
