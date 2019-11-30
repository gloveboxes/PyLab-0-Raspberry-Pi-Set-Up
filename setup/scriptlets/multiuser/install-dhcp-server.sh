#!/bin/bash

sudo apt install -y dnsmasq 

sudo systemctl stop dnsmasq

# Ethernet static IP
echo 'interface wlan0' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'static ip_address=192.168.4.1/24' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'nohook wpa_supplicant' | sudo tee -a /etc/dhcpcd.conf > /dev/null
sudo service dhcpcd restart

# sudo ip link set wlan0 down && sudo ip link set wlan0 up 
# sleep 10

# Configure DHCP
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
echo 'interface=wlan0' | sudo tee -a /etc/dnsmasq.conf > /dev/null
echo 'dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h' | sudo tee -a /etc/dnsmasq.conf > /dev/null
sudo systemctl start dnsmasq
sudo systemctl reload dnsmasq