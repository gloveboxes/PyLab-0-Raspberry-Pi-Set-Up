#!/bin/bash

while :
do
    echo -e "Installing required Libraries"
    sudo apt update && sudo apt install -y git python3-pip sense-hat nmap bmon libatlas-base-dev libopenjp2-7 libtiff5 vsftpd
    if [ $? -eq 0 ]
    then
        break
    else
        echo -e "\nUpdate failed. Retrying system update in 10 seconds\n"
        sleep 10
    fi
done

export PIP_DEFAULT_TIMEOUT=200 
sudo pip3 install --upgrade pip
# sudo -H pip3 install numpy pillow requests pandas matplotlib flask jupyter autopep8 pylint azure-cosmosdb-table
sudo -H pip3 install requests flask autopep8 pylint

# https://www.raspberrypi.org/forums/viewtopic.php?t=21632
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_memory_split 16

# Allow all to have access to I2C
sudo chown :i2c /dev/i2c-1
sudo chmod g+rw /dev/i2c-1

# Begin Patch for Raspberry Pi Sense Hat on Buster Headless/lite
sudo raspi-config nonint do_resolution 2 4
sudo sed -i 's/#hdmi_force_hotplug=1/hdmi_force_hotplug=1/g' /boot/config.txt
# End Patch for Raspberry Pi Sense Hat on Buster Headless/lite

# Disable hdmi to reduce power consumption
sudo sed -i -e '$i \/usr/bin/tvservice -o\n' /etc/rc.local

# Increase Swap space - this is targetted at systems with USB3 SSD
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# Set up Very Secure FTP Daemon
mkdir -p /home/pi/ftp
sudo mv /etc/vsftpd.conf /etc/vsftpd.conf.backup
echo "listen_ipv6=YES" | sudo tee /etc/vsftpd.conf
echo "anonymous_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "anon_root=/home/pi/ftp" | sudo tee -a /etc/vsftpd.conf
echo "local_umask=022" | sudo tee -a /etc/vsftpd.conf

sudo systemctl reload vsftpd
sudo systemctl restart vsftpd

sudo raspi-config nonint do_hostname $1
