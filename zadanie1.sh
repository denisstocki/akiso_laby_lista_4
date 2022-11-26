#! /bin/bash

touch /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane
printf "Ppid:|Pid:|Comm:|State:|Tty:|Rss:|Pgid:\n" >> dane
for f in `find /proc/ -maxdepth 1 -type d -name '*[0-9]*'`
do
	text=$(cat $f/stat | sed -e 's/(.*)//g')
	name=$(cat $f/comm)
	array1=($text)
	printf "%s|%s|%s|%s|%s|%s|%s\n" "${array1[2]}|${array1[0]}|$name|${array1[1]}|${array1[5]}|${array1[22]}|${array1[3]}" >> dane
done
column -t -s "|" /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane
rm /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dane
