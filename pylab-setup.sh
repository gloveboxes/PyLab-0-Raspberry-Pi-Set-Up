#!/bin/bash

sudo apt update && sudo apt install -y git

rm -r -f ~/PyLab && \
git clone --depth=1 https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git ~/PyLab && \
sudo chmod +x ~/PyLab/Lab-setup-multiuser/setup/*.sh && \
cd ~/PyLab/Lab-setup-multiuser/setup
