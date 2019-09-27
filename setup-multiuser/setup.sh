#!/bin/bash

LAB_DIR=~/PyLab/setup-multiuser

$LAB_DIR/10-Install-prerequisites.sh
if [ $? -ne 0 ]; then
    exit $?
fi

$LAB_DIR/11-install-core.sh
$LAB_DIR/12-load-ftp.sh
$LAB_DIR/13-load-vs-code.sh
$LAB_DIR/14-create-users.sh
$LAB_DIR/15-copy-lab.sh
$LAB_DIR/16-build-images.sh
# $LAB_DIR/17-copy-remote-ssh.sh

echo
echo
echo "The Raspberry Pi will now shutdown."
echo "Remove Power and attach the Pi Sense HAT."
echo "Remember when you restart your Raspberry Pi that you renamed it."

sudo halt