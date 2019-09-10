#!/bin/bash

cd

FTP_DIR=~/ftp

sudo systemctl start docker 

echo "building Lab 2 Docker Image"
sudo docker build -t glovebox:latest -f $FTP_DIR/PyLab/PyLab-2-Docker-Debug

echo "Building Telemetry Docker Image"
sudo docker build -t lab-telemetry-service:latest -f $FTP_DIR/PyLab/PyLab-3-Pi-Sense-Service

echo "Starting Telemetry Docker Image"
sudo docker run -d \
-p 8080:8080 \
--privileged \
--restart always \
--device /dev/i2c-1 \
--name pi-sense-hat \
lab-telemetry-service:latest