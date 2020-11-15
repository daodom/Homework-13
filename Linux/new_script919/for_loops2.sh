#!/bin/bash

storeoutput=$HOME/new_script0919/forloop.txt
paths=(/etc/shadow /etc/passwd)

for permission in  ${paths[@]}
 do
  ls -l >> storeoutput 
done

path2=$(ls -l /home)

for ID in ${path2[@]}
do
 iduser=id ${path2[@]}

if [ iduser -gt 1000 ]
 then 
 echo $ID "No ability"
 else
  echo $ID "Has ability"
 
fi
done

