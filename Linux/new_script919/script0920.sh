#! /bin/bash

for script in $(ls ~/new_script919);
do 
  if [ ! -w ~/new_script919/$script ]
 then 
 chmod +w ~/new_script919/$script
fi
done
