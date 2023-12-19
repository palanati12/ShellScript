#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

FILE="/cat/passwd"

if [ ! -f $FILE ]
then
    echo -e " $R source file: $FILE does not exists $N"
fi

while IFS= ":" read -r username password user_id group_id user_fullname home_dir shell_path
do 
   echo "username: $username"
   echo "user ID: $user_id"
   echo "user fullname: $user_fullname"
done < $FILE