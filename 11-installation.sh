#!/bin/bash

uSERID=$(id -u)
echo "userID is ::$uSERID"

if [ $uSERID -ne 0 ]
then
   echo "Please run the script with root privelliges"
   exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed, going to install it ......"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation is not sccess..... check it"
        exit 1
    else
        echo "mysql installation is scess....completed"
    fi
else
   echo "mysql is already installed, nothing to do......"
fi