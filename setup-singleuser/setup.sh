#!/bin/bash

LAB_DIR=~/PyLab/setup-singleuser

$LAB_DIR/11-install-core.sh
if [ $? -ne 0 ]; then
    exit $?
fi

$LAB_DIR/12-load-ftp.sh
$LAB_DIR/14-create-users.sh
$LAB_DIR/15-copy-lab.sh
$LAB_DIR/16-build-images.sh

echo
echo
echo "The Raspberry Pi will now shutdown."
echo "Remove Power and attach the Pi Sense HAT."
echo "Remember when you restart your Raspberry Pi that you renamed it."

sudo halt