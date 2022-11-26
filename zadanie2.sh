#! /bin/bash

touch /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane2
printf "Ppid:|Pid:|Comm:|State:|Tty:|Rss:|Pgid:\n" >> dane
proccesses=$(find /proc/ -maxdepth 1 -type d -name '*[0-9]*')
for f in $proccesses
do
	ppid=$(awk '/PPid:/ {print}' $f/status)
	printf "%s\n" "$ppid"
done
rm /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane2
