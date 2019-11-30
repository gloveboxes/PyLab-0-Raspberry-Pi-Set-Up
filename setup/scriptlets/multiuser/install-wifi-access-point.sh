#!/bin/bash

sudo apt update && sudo apt install -y dnsmasq hostapd

sudo systemctl stop dnsmasq
sudo systemctl stop hostapd


# Configure Hostapd - Host Access Point
cat ~/PyLab-0-Raspberry-Pi-Set-Up-master/setup/scriptlets/multiuser/hostapd.conf | sudo tee -a /etc/hostapd/hostapd.conf > /dev/null
sudo sed -i "s/ssid=RaspberryPi/ssid=$(sudo raspi-config nonint get_hostname)/g" /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' | sudo tee -a /etc/default/hostapd > /dev/null
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd


