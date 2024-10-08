#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
uSERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is $R FAILED....check with that $N" | tee -a $LOG_FILE
       exit 1
    else
       echo -e "$2 is $G SUCCESS...... completed $N"  | tee -a $LOG_FILE
    fi
}
CHECK_ROOT(){
    if [ $uSERID -ne 0 ] 
    then
        echo -e "$R user has not super root privelliages access is not there..... $N"  | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$G user has root access is there... continue with that.....$N"  | tee -a $LOG_FILE
    fi
}
uSAGE(){
    echo -e " $R uSAGE:: $N sudo sh 16-redirectors.sh package1 package2..." 
    exit 1
      
}

echo  -e "$Y script started a execting at $N: $(date)"  | tee -a $LOG_FILE
CHECK_ROOT

if [ $# -eq 0 ]
then
   uSAGE
fi 

for package in $@
do
  dnf list installed $package  &>>$LOG_FILE

  if [ $? -ne 0 ]
  then
       echo -e "$R $package is not installed.... going to install it......$N"  | tee -a $LOG_FILE
       dnf install $package -y  &>>$LOG_FILE
       VALIDATE $? "$package installing......"  | tee -a >>$LOG_FILE
    
   else
       echo -e "$Y $package is already installed nothing to do $N"  | tee -a $LOG_FILE
   fi
done