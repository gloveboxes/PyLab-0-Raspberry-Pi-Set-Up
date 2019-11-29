#!/bin/bash

scriptDir="~/PyLab-0-Raspberry-Pi-Set-Up-master/setup/scriptlets"

declare -a options=( \
            "Update the System" \
            "Refresh PyLab" \
            "Copy VS Code Server to all users"
            "Create PyLab Users"
            "Delete PyLab and ALL Dev users"
            )

declare -a cmds=(\
            "sudo apt update && sudo apt upgrade -y" \
            "$scriptDir/common/load-ftp.sh && $scriptDir/common/copy-lab-to-user.sh" \
            "$scriptDir/multiuser/copy-remote-ssh.sh"
            "$scriptDir/multiuser/create-users.sh" 
            "$scriptDir/multiuser/cleanup-lab.sh"
            )

optionslength=${#options[@]}

while :
do
    echo -e "\n"
    for (( i=1; i<${optionslength}+1; i++ ));
    do
        echo "$i) "  ${options[$i-1]}
    done
    echo 
    echo "Q) Quit"

    echo
    read -p "Option number: " selection

    if [ $selection == "Q" ] || [ $selection == "q" ]
    then
        exit
    fi

    re='^[0-9]+$'
    if ! [[ $selection =~ $re ]] ; then
        echo "error: Not a number" >&2;
    else
        if [ "$selection" -ge "1" ] && [ "$selection" -le "$optionslength" ]
        then 
            set +e
            eval ${cmds[$selection - 1]}
            set -e
            echo 
            echo "Completed"
        fi
    fi
done
