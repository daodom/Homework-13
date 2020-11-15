#!/bin/bash

mkdir ~/research6_0919 2> /dev/null #ignore all errors 2> /dev/null
output=$HOME/research6_0919/sys_info.txt

echo "A Quick System Audit Script"
date
echo "Machine Type Info"
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP info $(ip addr | head -9 | tail -1) \n"
echo "Hostname: $(hostname -s ) " #gives short name of host
echo "DNS Servers: "
cat /etc/resolv.conf
echo "Memory Info: "
free
echo -e "\nCPU Info:"
lscpu | grep CPU #no space between ls and cpu
echo -e "\nDisk Usage:"
df -H | head -2
echo -e "\nWho is logged in: \n $(who -a) \n"
sudo find /home -type f -perm 777 >> ~/research6_0919/777list.txt
ps aux --sort -%mem |awk {'print $1, $2, $4, $11'} | head -n 11 >> research6_0919/777list.txt

paths= ('/etc/shadow' '/etc/passwd')

echo  -e "\n Printing out permissions for etc folder \n"

if [ ! -d /home/sysadmin/research3 ]
 then
   mkdir /home/sysadmin/research0920_practice
fi 

for file1 in {$paths[@]}
do 
  ls -l $file1 >> $output
done
