#!/bin/bash

sudo apt update && sudo apt install -y hostapd

sudo systemctl stop hostapd

# Configure Hostapd - Host Access Point
cat ~/PyLab-0-Raspberry-Pi-Set-Up-master/setup/scriptlets/multiuser/hostapd.conf | sudo tee -a /etc/hostapd/hostapd.conf > /dev/null
sudo sed -i "s/ssid=RaspberryPi/ssid=$(sudo raspi-config nonint get_hostname)/g" /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' | sudo tee -a /etc/default/hostapd > /dev/null
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

# Enable IP V4 Packet Routing
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf > /dev/null
sudo sysctl -p > /dev/null

# enable Ethernet to WiFi traffic routing
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo sed -i -e '$i \iptables-restore < /etc/iptables.ipv4.nat\n' /etc/rc.local