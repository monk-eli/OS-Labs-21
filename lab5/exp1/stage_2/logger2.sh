#!/bin/bash

> "log/top_5-2.log"
> "log/top_proc-2.log"
echo "PTime" > "log/top_mem-2.log"
echo "PTime" > "log/top_swap-2.log"

while true
do
	proc=$(top -b -n1 | grep "mem2.sh" | head -n1)
	proc_state=$(echo "$proc" | awk '{print $8}')
	proc_time=$(echo "$proc" | awk '{print $11}')

	if [ -z proc ] || [ "$proc_state" != "R" ]
	then
		exit 0
	fi

	mem_usage=$(top -b -n1 | grep "MiB Mem")
	swap_usage=$(top -b -n1 | grep "MiB Swap")
	top_five=$(top -b -n1 | head -n12 | tail -n5)

	echo -e "$top_five\n" >> "log/top_5-2.log"
	echo "$proc_time  $mem_usage" >> "log/top_mem-2.log"
	echo "$proc_time  $swap_usage" >> "log/top_swap-2.log"
	echo "$proc_time  $proc" >> "log/top_proc-2.log"

	sleep 1
done
