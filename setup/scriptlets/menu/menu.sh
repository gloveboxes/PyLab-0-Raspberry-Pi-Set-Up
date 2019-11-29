#!/bin/bash

scriptDir="~/PyLab-0-Raspberry-Pi-Set-Up-master/setup/scriptlets"

declare -a options=( \
            "Update the System" \
            "Refresh PyLab" \
            "Refresh VS Code Server"
            )

declare -a cmds=(\
            "sudo apt update && sudo apt upgrade -y" \
            "$scriptDir/common/load-ftp.sh && $scriptDir/common/copy-lab-to-user.sh" \
            "$scriptDir/multiuser/copy-remote-ssh.sh"
            )

optionslength=${#options[@]}

while :
do
    echo -e "\n"
    for (( i=1; i<${optionslength}+1; i++ ));
    do
        echo "$i) "  ${options[$i-1]}
    done

    read -p "Option number: " selection

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
