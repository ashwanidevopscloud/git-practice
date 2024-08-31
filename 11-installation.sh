#!/bin/bash

uSERID=$(id -u)


echo "userid is :: $uSERID"

if [ $uSERID -ne 0]
then
    echo "To take yo don't have root super priveliges access"
    exit 1
else
    echo "i have super priveliges access"
fi
dnf install git -y