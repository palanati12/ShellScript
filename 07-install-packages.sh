#!/bin/bash

ID =$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date %F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
if ( $1 -ne 0 )
then 
    echo -u "ERROR:: $2 ....$R is failed $N"
else
    echo -u "$2 ....$G is success $N"        
}

if ( $ID -ne 0 )
then
    echo -u " $R ERROR:: please run the script with root access $N"
    exit 1
else
    echo -u " $G You are the root user $N"  
fi

for package in $@
do
  yum list installed $package
  if ($? -ne o)
  then
      yum install $package -y &>> $LOGFILE
      VALIDATE $?  "installation of $package"
  else 
      echo -u "$package is already installed...$Y skipping $N "
fi
done
      


