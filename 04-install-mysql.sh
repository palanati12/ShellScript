#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
echo "ERROR:please run te script with root access"
else
echo "you are the root acess"
fi

