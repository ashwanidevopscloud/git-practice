#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
uSERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is $R failed....check with that $N"
       exit 1
    else
       echo "$2 is $G sccess...... completed $N"
    fi
}
CHECK_ROOT(){
    if [ $uSERID -ne 0 ] 
    then
        echo "user has not super root privelliages access is not there....."
        exit 1
    else
        echo "user has root access is there... continue with that....."
    fi
}

CHECK_ROOT
dnf list installed git

if [ $? -ne 0 ]
then
    echo "git is not installed.... going to install it......"
    dnf install git -y
    VALIDATE $? "installing git......"
    
else
    echo "git is aleady installed nothing to do"
fi