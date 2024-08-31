#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
uSERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is $R FAILED....check with that $N"
    else
       echo -e "$2 is $G SUCCESS...... completed $N"
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

for package in $@
do
  dnf list installed $package

  if [ $? -ne 0 ]
  then
       echo "$package is not installed.... going to install it......"
       dnf install $package -y
       VALIDATE $? "$package installing......"
    
   else
       echo "$package is aleady installed nothing to do"
   fi
done