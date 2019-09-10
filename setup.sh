#!/bin/bash

# bash -c "$(curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/setup.sh)"

sudo apt install -y git

rm -r -f ~/PyLab
echo 'Git Cloning the Setup Libraries'
git clone --depth=1 https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git ~/PyLab

sudo chmod +x ~/PyLab/setup-multiuser/*.sh
sudo chmod +x ~/PyLab/setup-singleuser/*.sh

while true; do
    read -p "Single or Multi user set up? ([S]ingle, [M]ulti), [Q]uit: " PyLab_Setup_Mode
    case $PyLab_Setup_Mode in
        [Ss]* ) break;;
        [Mm]* ) break;;
        [Qq]* ) exit 1;;
        * ) echo "Please answer yes(y), no(n), or quit(q).";;
    esac
done

if [ $PyLab_Setup_Mode = 'S' ] || [ $PyLab_Setup_Mode = 's' ]; then   
    echo 'single mode'
#   ~/~/PyLab/setup-singleuser/setup.sh
else 
    echo 'multi mode'
fi

