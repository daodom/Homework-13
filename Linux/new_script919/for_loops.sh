#! /bin/bash



favstates=( 'Georgia' 'South Carolina' 
             'North Carolina' 'Illinois'
              'California')

for favstate in ${favstates[@]}
 do 
  if [ $favstate == 'Georgia' ]
  then
     echo " Georgia is the best state"
    else
     echo "Go back to work"

fi
done

homefile=($HOME/new_script019)

for files in ${homefile[@]}
 do 
  ls -l
done


output5=$(find /home -type f -perm 777)

for perms in ${output5[@]}
 do 
  echo  $perms
done

