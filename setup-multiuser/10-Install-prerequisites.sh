INSTALL_FAN_SHIM="false"
BOOT_USB3="false"

while true; do
    read -p "Name your Raspberry Pi: " RPI_NAME
    read -p "You wish to name your Raspberry Pi '$RPI_NAME'. Correct? ([Y]es/[N]o/[Q]uit)" yn
    case $yn in
        [Yy]* ) sudo raspi-config nonint do_hostname $RPI_NAME; break;;
        [Qq]* ) exit 1;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes(y), no(n), or quit(q).";;
    esac
done

while true; do
    read -p "Do you wish to enable USB3 SSD Boot Support ?' ([Y]es/[N]o/[Q]uit)" yn
    case $yn in
        [Yy]* ) BOOT_USB3="true"; break;;
        [Qq]* ) exit 1;;
        [Nn]* ) break;;
        * ) echo "Please answer yes(y), no(n), or quit(q).";;
    esac
done

if [ "$BOOT_USB3" == "true" ]; then
    sudo fdisk /dev/sda
    sudo mkfs.ext4 /dev/sda1
    sudo mkdir /media/usbdrive
    sudo mount /dev/sda1 /media/usbdrive
    sudo rsync -avx / /media/usbdrive
    sudo sed -i '$s/$/ root=\/dev\/sda1 rootfstype=ext4 rootwait/' /boot/cmdline.txt
    sudo reboot
fi

while true; do
    read -p "Do you wish to Install Fan SMIM Support ?' ([Y]es/[N]o/[Q]uit)" yn
    case $yn in
        [Yy]* ) INSTALL_FAN_SHIM="true"; break;;
        [Qq]* ) exit 1;;
        [Nn]* ) break;;
        * ) echo "Please answer yes(y), no(n), or quit(q).";;
    esac
done

if [ "$INSTALL_FAN_SHIM" == "true" ]; then
    sudo apt install -y git sudo python3-pip vsftpd && \
    git clone https://github.com/pimoroni/fanshim-python && \
    cd fanshim-python && \
    sudo ./install.sh && \
    cd examples && \
    sudo ./install-service.sh --on-threshold 65 --off-threshold 55 --delay 2
fi
