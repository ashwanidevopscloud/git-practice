#!/bin/bash

uSERID=$(id -u)
echo "userID is ::$uSERID"

if [ $uSERID -ne 0 ]
then
   echo "Please run the script with root privelliges"
   exit 1
fi
dnf list installed git
if [ $? -ne 0 ]
then
   echo "git is not installed, going to install it ....."
   dnf install git -y
else
   echo "Git is already installed, nothing to do......."
fi