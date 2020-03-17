#!/bin/bash
 
myip=`ifconfig $1 | grep "inet " | cut -d " " -f 10`
if [ $myip != "" ]
then
	i=`ifconfig $1 | grep "inet " | cut -d " " -f 10 | cut -d "." -f 1,2,3`
	for f in `seq 1 254`;
	do
		if [ $myip == $i.$f ]
		then
			echo -e $myip "\033[1;36m <<=== This Device\033[0m" &
		else
			ping -c 1 $i.$f | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
		fi
	done
	exit
else
	clear;echo -e "\033[0;31m \n.....Check The Input And Try Again.....\n\033[0m "
fi
exit
