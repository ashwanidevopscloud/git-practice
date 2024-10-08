#!/bin/bash

uSERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
CHECK_ROOT(){
    if [ $uSERID -ne 0 ]
    then
        echo "you don't have root super privelliages"
        exit 1
    else
        echo "I have root access.... i will procide with that....."
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ...... $R FAILED $N"
        exit 1
    else
        echo -e "$2 is ..... $G SUCCESS $N"
    fi
}
CHECK_ROOT
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