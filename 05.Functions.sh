#!/bin/bash

ID=$( id -u ) 

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]   
then
    echo -e "installing $2 $R is failed $N"
exit 1    
else 
    echo -e "installing $2 is $G success $N"  
fi          
}


if [ $ID -ne 0 ]
then 
    echo "please access with root user"
    exit 1
else 
    echo "you are a root user"
fi    

yum install mysql -y &>>$LOGFILE

VALIDATE $?  "mysql"

yum install git -y &>>$LOGFILE

VALIDATE $? "git"



