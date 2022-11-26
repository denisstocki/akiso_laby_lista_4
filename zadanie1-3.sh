#! /bin/bash

path=/home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4
find /proc/*[0-9]* -maxdepth 0 -exec mkdir -p /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4{} \;
find /proc/*[0-9]*/status -exec cp {} /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4{} \;
touch /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane
printf "PPid:|Pid:|Comm:|State:|Rss:|Pgid:|Sid:\n" >> $path/dane
for dir in `ls /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/proc`
do
	ppid=$(awk '/PPid:/ {print $2}' $path/proc/$dir/status)
	pid=$(awk '/Pid:/ {print $2}' $path/proc/$dir/status)
	comm=$(awk '/Name:/ {print $2}' $path/proc/$dir/status)
	state=$(awk '/State:/ {print $2}' $path/proc/$dir/status)
	rss=$(awk '/VmRSS:/ {print $2}' $path/proc/$dir/status)
	pgid=$(awk '/NSpgid:/ {print $2}' $path/proc/$dir/status)
	sid=$(awk '/NSsid:/ {print $2}' $path/proc/$dir/status)
	printf "$ppid|$pid|$comm|$state|$rss|$pgid|$sid\n" >> $path/dane
done
column $path/dane -t -s "|"
