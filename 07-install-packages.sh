#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo -e "ERROR:: $2 ....$R is failed $N"
else
    echo -e "$2 ....$G is success $N" 
fi           
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR::please run the script with root access $N"
    exit 1
else
    echo -e "$G You are the root user $N"  
fi

for package in $@
do
  yum list installed $package  #to konw the list of packages installed here
  if [ $? -ne 0 ]
  then
      yum install $package -y &>> $LOGFILE
      VALIDATE $?  "installation of $package"
  else 
      echo -e "$package is already installed...$Y skipping $N "
fi
done
      


