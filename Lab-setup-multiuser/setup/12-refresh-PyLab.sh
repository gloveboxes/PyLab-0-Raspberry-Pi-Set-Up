#!/bin/bash

cd ~/

rm -r -f ~/PyLab
echo "Copy PyCon Set Up"
git clone --depth=1 https://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git ~/PyLab && \
sudo chmod +x ~/PyLab/Lab-setup-multiuser/setup/*.sh && \
cd ~/PyLab/Lab-setup-multiuser/setup

FTP_DIR=~/ftp
rm -r $FTP_DIR/PyLab

sudo rm -r -f $FTP_DIR/scripts
sudo rm -r -f $FTP_DIR/PyLab

mkdir -p $FTP_DIR/scripts
mkdir -p $FTP_DIR/PyLab

echo "Copy Labs"
git clone --depth=1 https://github.com/gloveboxes/PyLab-1-Debugging-a-Python-Internet-of-Things-Application.git $FTP_DIR/PyLab/PyLab-1-Python-Debug
git clone --depth=1 https://github.com/gloveboxes/PyLab-2-Python-Azure-IoT-Central-and-Docker-Container-Debugging.git $FTP_DIR/PyLab/PyLab-2-Docker-Debug
git clone --depth=1 https://github.com/gloveboxes/PyLab-3-Pi-Sense-Hat-Telemetry-Service.git $FTP_DIR/PyLab/PyLab-3-Pi-Sense-Service


echo "Copy SSH Scripts"
cp  ~/PyLab/Lab-setup-multiuser/scripts/* $FTP_DIR/scripts