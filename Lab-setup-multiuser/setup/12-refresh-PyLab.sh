#!/bin/bash

cd ~/

rm -r -f ~/PyLab && \
git clone --depth=1 https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git ~/PyLab && \
sudo chmod +x ~/PyLab/Lab-setup-multiuser/setup/*.sh && \
cd ~/PyLab/Lab-setup-multiuser/setup

FTP_DIR=~/ftp
rm -r $FTP_DIR/PyLab

echo "Copy Labs"
INSTALL_DIR=/mnt/sda2 && \
git clone --depth=1 https://github.com/gloveboxes/PyLab-1-Debugging-a-Python-Internet-of-Things-Application.git $FTP_DIR/PyLab/PyLab-1-Python-Debug

INSTALL_DIR=/mnt/sda2 && \
git clone --depth=1 https://github.com/gloveboxes/PyLab-2-Python-Azure-IoT-Central-and-Docker-Container-Debugging.git $FTP_DIR/PyLab/PyLab-2-Docker-Debug
