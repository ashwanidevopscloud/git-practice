#!/bin/bash

uSERID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "command is ...... FAILED"
        exit 1
    else
        echo "command is ..... SCESSS"
    fi
}
if [ $uSERID -ne 0 ]
then
    echo "you don't have root super privelliages"
    exit
else
    echo "I have root access.... i will procide with that....."
fi
VALIDATE $?

# dnf list installed git

# if [ $? -ne 0 ]
# then
#    echo "Git is not installed....., going to install it"
#    dnf install git -y
#    if [ $? -ne 0 ]
#    then
#        echo "git installation is failes.....check it..."
#        exit 1
#     else
#        echo "git installation in scesss....completed"
#     fi
# else
#    echo "Git is already installed.... nothing to do"
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed.... going to install it"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation is failed...check it"
#         exit 1
#     else
#         echo "mysql installation is scess... completed"
#     fi
# else
#     echo "mysql is aleady installed.... nothing tod do"
# fi