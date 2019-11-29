#!/bin/bash


function Confirm() {

    echo -e "\nThis script will install everything needed for the Raspberry Pi Python Lab\n"

    echo -e "Always be careful when running scripts and commands copied"
    echo -e "from the internet. Ensure they are from a trusted source.\n"

    echo -e "If you want to see what this script does before running it,"
    echo -e "you should run: 'curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/setup.sh'\n"


    printf "Do you wish to continue? [y/N]: "
    read -n1 response

    if [ ! $response = 'y' ]
    then
        exit
    fi
}

Confirm
echo -e "\n"

cd ~/

curl -O -J -L https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/archive/master.zip

BOOTSTRAP_DIR=~/PyLab-0-Raspberry-Pi-Set-Up-master
if [ -d "$BOOTSTRAP_DIR" ]; then
    echo -e "\nPermission required to remove existing Raspberry Pi Installation Bootstrap Directory\n"
    sudo rm -r -f ~/PyLab-0-Raspberry-Pi-Set-Up-master
fi

rm -r -f PyLab-0-Raspberry-Pi-Set-Up-master
unzip -qq PyLab-0-Raspberry-Pi-Set-Up-master.zip
rm PyLab-0-Raspberry-Pi-Set-Up-master.zip

echo -e "\nSetting Execute Permissions for Installation Scripts\n"
cd ~/PyLab-0-Raspberry-Pi-Set-Up-master/setup
sudo chmod +x *.sh

while true; do
    echo ""
    read -p "Multi or Single User Set Up? ([M]ulti, [S]ingle), or [Q]uit: " PyLab_Setup_Mode
    case $PyLab_Setup_Mode in
        [Mm]* ) break;;
        [Ss]* ) break;;
        [Qq]* ) exit 1;;
        * ) echo "Please answer [M]aster, [N]ode), or [Q]uit.";;
    esac
done

if [ $PyLab_Setup_Mode = 'M' ] || [ $PyLab_Setup_Mode = 'm' ]; then   
    ./install-multiuser.sh
else 
    ./install-singleuser.sh
fi