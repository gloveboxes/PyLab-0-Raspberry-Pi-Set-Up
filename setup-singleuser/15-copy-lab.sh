#!/bin/bash

FTP_DIR=~/ftp

for i in {01..01}
do
    echo "Set up lab content for user dev$i"

    sudo rm -r -f /home/dev$i/PyLab
    sudo mkdir -p /home/dev$i/PyLab

    sudo cp -r $FTP_DIR/PyLab/* /home/dev$i/PyLab

    sudo chown -R dev$i:dev$i /home/dev$i
done
