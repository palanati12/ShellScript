#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
echo "ERROR:please run te script with root access"
exit 1
else
echo "you are the root acess"
fi
install mysql -y

if [$? -ne 0]
then
    echo "ERROR::Installing mysql is failed"
    exit 1
else
    echo "mysql is sucessfully installed"
fi
