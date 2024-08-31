#!/bin/bash

uSERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is ...... FAILED"
        exit 1
    else
        echo "$2 is ..... SCESSS"
    fi
}
if [ $uSERID -ne 0 ]
then
    echo "you don't have root super privelliages"
    exit 1
else
    echo "I have root access.... i will procide with that....."
fi


dnf list installed git

if [ $? -ne 0 ]
then
   echo "Git is not installed....., going to install it"
   dnf install git -y
   VALIDATE $? "installing git"
else
   echo "Git is already installed.... nothing to do"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.... going to install it"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo "mysql is aleady installed.... nothing tod do"
fi