#!/bin/bash

# Ethernet static IP
echo 'interface wlan0' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'static ip_address=192.168.4.1/24' | sudo tee -a /etc/dhcpcd.conf > /dev/null
echo 'nohook wpa_supplicant' | sudo tee -a /etc/dhcpcd.conf > /dev/null
sudo service dhcpcd restart

# Configure DHCP
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
echo 'interface=wlan0' | sudo tee -a /etc/dnsmasq.conf > /dev/null
echo 'dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h' | sudo tee -a /etc/dnsmasq.conf > /dev/null
sudo systemctl start dnsmasq

# Enable IP V4 Packet Routing
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf > /dev/null
sudo sysctl -p > /dev/null

# enable Ethernet to WiFi traffic routing
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo sed -i -e '$i \iptables-restore < /etc/iptables.ipv4.nat\n' /etc/rc.local

sudo reboot