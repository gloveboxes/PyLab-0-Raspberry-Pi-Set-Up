#!/bin/bash

# curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/pylab-setup.sh | bash

sudo apt update && sudo apt install -y git

rm -r -f ~/PyLab
echo 'Git Cloning the Setup Libraries'
git clone --depth=1 https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git ~/PyLab

sudo chmod +x ~/PyLab/setup-multiuser/setup/*.sh
sudo chmod +x ~/PyLab/setup-singleuser/setup/*.sh
