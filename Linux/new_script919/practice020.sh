#!/bin/bash

#Check for root user

if [ $UID = 0 ]
then 
 echo "Do not continue"
exit
fi

newvariable=$HOME/new_script0919.text
newvariable2=$HOME/news_scpipt0920.txt

if [ ! -d /home/sysadmin/research0920 ]
 then
 mkdir /home/sysadmin/research0920
 else 
  echo "directory made"
fi

if [ -f $HOME/sys_info.txt ] #$HOME is substitufe for /home/sysadmin
 then
  rm-r /home/sysadmin/sys_info.txt
 else
  echo "action complete"
fi


ip addr | grep inet |  tail -2 | head -1 >> newvariable
find /home -type f -perm 777 >> newvariable2

