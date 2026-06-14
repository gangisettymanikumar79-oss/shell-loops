#!/bin/bash
UserID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

# check the root access or not
if [ $UserID -ne 0 ]; then
   echo "please run the script with proper reason"
   exit 1
fi
for package in $@
 do 
    echo "installing $package"
    dnf list installing $package
 if [ $? -ne 0 ]; then 
    dnf install $package -y
 else
    echo "$package already installed ... SKIPPING"
fi
 done




