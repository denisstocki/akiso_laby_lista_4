#! /bin/bash

for f in `find /proc/*[0-9]*/status`
do
	cp $f /home/denis/Desktop/studia/inzynier/semestr3/akiso/laby/lista4/dir
done
