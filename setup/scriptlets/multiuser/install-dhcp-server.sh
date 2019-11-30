#!/bin/bash
sudo apt install  isc-dhcp-server
sudo service isc-dhcp-server stop

echo 'interface wlan0' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'static ip_address=192.168.100.1/24' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'nohook wpa_supplicant' | sudo tee -a /etc/dhcpcd.conf > /dev/null
sudo service dhcpcd restart

# bind IPV4 to eth0
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="wlan0"/g' /etc/default/isc-dhcp-server > /dev/null
sudo sed -i 's/INTERFACESv6=""/INTERFACESv4="wlan0"/g' /etc/default/isc-dhcp-server > /dev/null

# Append required dhcp config to system config
~/PyLab-0-Raspberry-Pi-Set-Up-master/setup/scriptlets/multiuser/dhcpd.conf | sudo tee -a /etc/dhcp/dhcpd.conf > /dev/null

echo -e "\nStarting DHCP Server\n"

sudo service isc-dhcp-server start