#!/bin/bash

uSERID=$(id -u)
if [ $uSERID -ne 0 ]
then
    echo "you don't have root super privelliages"
    exit
else
    echo "I have root access.... i will procide with that....."
fi

dnf list installed git
if [ $? -ne 0 ]
then
   echo "Git is not installed....., going to install it"
   dnf install git -y
   if [ $? -ne 0 ]
   then
       echo "git installation is failes.....check it..."
       exit 1
    else
       echo "git installation in scesss....completed"
else
   echo "Git is already installed.... nothing to do"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
   echo mysql is not installed.... going to install it"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
      echo "mysql installation is failed...check it"
      exit 1
    else
       echo "mysql installation is scess... completed"
    fi
fi
