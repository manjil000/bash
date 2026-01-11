#!/bin/bash

#sinngle line comments
:'multilie 
comments'

username = "jay"


#Reading user input
read -p "Enter ur username: " user
echo "Username: $user"

#conditional statements
if [ "$EUID" -ne 0 ]; then
   echo "Ur not running this script as the root user."
else
   echo "U are running as root"
fi

#counting first methods

echo "Counting from 1 to 5"

for i in {1..5}; do
   echo $i
   #echo "$i" (same result)
done

echo "Counting from 5 to 10 method 2"
for i in $(seq 5 10); do
   echo $i
done

#Functions in bash scripting

function greet()
{
   echo "Hello, $1!" #----> output Hello Alice
}
greet "Alice"

#COnditioal case statements (imp)

echo "Enter a numb betwn 1 and 2"
read num
case $num in
   1) echo "YOu choose 1" ;;
   2) echo "Your choose 2";;
   *) echo "Invalid choice";;
esac

#file operationns
filename = $3

if [ -e "$filename"  ] && [ -d "$filename" ]; then
   echo "File exists and is a directory"
else
   echo "File don't exist or is not a dir"
fi

#argumetns in bash (---> RUnn like this ./bash_scripting_basics.sh a s d)
echo "First argumennts: $1"
echo "First argumennts: $2"


#Exit status code
cat noexistance_file.txt 2> /dev/null 
echo "Exit status: $?"  #output 1 for file not found


#Workig with Index arrays 
fruits=("apple" "bannana" "cherry")  #NOTE: There should not be spaces like fruits = (....) bash dont except that as array
echo "Fruit 1 i the array is: ${fruits[0]}"

#associative arrays
declare -A capitals
capitals[NNepal]="Katmadu"
capitals[france]="Paris"
echo "capital of desh: ${capitals[NNepal]}"

current_date=$(date) # Note not curl parathesis and also no spaces near equals
echo "Todays date is: $current_date"



