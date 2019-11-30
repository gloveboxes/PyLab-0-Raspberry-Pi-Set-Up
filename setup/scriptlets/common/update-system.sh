#!/bin/bash

while :
do
    echo -e "Updating the Raspberry Pi Operating System"
    sudo apt update && sudo apt upgrade -y
    if [ $? -eq 0 ]
    then
        break
    else
        echo -e "\nUpdate failed. Retrying system update in 10 seconds\n"
        sleep 10
    fi
done