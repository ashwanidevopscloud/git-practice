#!/bin/bash
LOGS_FOLDER="var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%m-%s)
LOG-FILE="$LOGS_FOLDE/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"
uSERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is $R FAILED....check with that $N" &>>$LOG-FILE
       exit 1
    else
       echo -e "$2 is $G SUCCESS...... completed $N"  &>>$LOG-FILE
    fi
}
CHECK_ROOT(){
    if [ $uSERID -ne 0 ] 
    then
        echo "user has not super root privelliages access is not there....."  &>>$LOG-FILE
        exit 1
    else
        echo "user has root access is there... continue with that....."  &>>$LOG-FILE
    fi
}

CHECK_ROOT

for package in $@
do
  dnf list installed $package  &>>$LOG-FILE

  if [ $? -ne 0 ]
  then
       echo "$package is not installed.... going to install it......"  &>>$LOG-FILE
       dnf install $package -y  &>>$LOG-FILE
       VALIDATE $? "$package installing......"  &>>$LOG-FILE
    
   else
       echo "$package is already installed nothing to do"  &>>$LOG-FILE
   fi
done