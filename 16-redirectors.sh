#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"
uSERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is $R FAILED....check with that $N" &>>$LOG_FILE
       exit 1
    else
       echo -e "$2 is $G SUCCESS...... completed $N"  &>>$LOG_FILE
    fi
}
CHECK_ROOT(){
    if [ $uSERID -ne 0 ] 
    then
        echo -e "$R user has not super root privelliages access is not there..... $N"  &>>$LOG_FILE
        exit 1
    else
        echo -e "$G user has root access is there... continue with that.....$N"  &>>$LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
  dnf list installed $package  &>>$LOG_FILE

  if [ $? -ne 0 ]
  then
       echo "$package is not installed.... going to install it......"  &>>$LOG_FILE
       dnf install $package -y  &>>$LOG_FILE
       VALIDATE $? "$package installing......"  &>>$LOG_FILE
    
   else
       echo "$package is already installed nothing to do"  &>>$LOG_FILE
   fi
done