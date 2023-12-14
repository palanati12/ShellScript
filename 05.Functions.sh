#!/bin/bash

ID=$( id -u ) 

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
if [ $1 -ne 0 ]   
then
    echo "installing $2 is failed"
else 
    echo "installing $2 is success"  
fi          
}


if [ ID -ne 0 ]
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



