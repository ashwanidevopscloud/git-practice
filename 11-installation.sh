#!/bin/bash

uSERID=$(id -u)
echo " user id is: $uSERID"
  #dnf install git -y
if [ $uSERID -ne 0 ]
then
   echo "Please rn the scrpit with root priveleges"
else
   echo " i am rnning with root priveleges"
fi