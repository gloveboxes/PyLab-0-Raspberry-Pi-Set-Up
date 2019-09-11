INSTALL_FAN_SHIM="false"
BOOT_USB3="false"
OS_UPDATE="false"

STATE=~/.PyLabState
RUNNING=true

while $RUNNING; do
  case $([ -f $STATE ] && cat $STATE) in
   INIT)
        while true; do
            read -p "Do you wish to enable USB3 SSD Boot Support ?' ([Y]es/[N]o/[Q]uit)" yn
            case $yn in
                [Yy]* ) BOOT_USB3="true"; break;;
                [Qq]* ) RUNNING=false; exit 1;;
                [Nn]* ) break;;
                * ) echo "Please answer yes(y), no(n), or quit(q).";;
            esac
        done

        echo "UPDATE" > $STATE

        if [ "$BOOT_USB3" == "true" ]; then
            sudo fdisk /dev/sda
            sudo mkfs.ext4 /dev/sda1
            sudo mkdir /media/usbdrive
            sudo mount /dev/sda1 /media/usbdrive
            sudo rsync -avx / /media/usbdrive
            sudo sed -i '$s/$/ root=\/dev\/sda1 rootfstype=ext4 rootwait/' /boot/cmdline.txt
            sudo reboot
        fi
      ;;

    UPDATE)
        while true; do
            read -p "Do you wish to update the Raspberry Pi Operating System. The Raspberry Pi will reboot (Recommended) ?' ([Y]es/[N]o/[Q]uit)" yn
            case $yn in
                [Yy]* ) OS_UPDATE="true"; break;;
                [Qq]* ) RUNNING=false; exit 1;;
                [Nn]* ) break;;
                * ) echo "Please answer yes(y), no(n), or quit(q).";;
            esac
        done

        echo "RENAME" > $STATE
        if [ "$OS_UPDATE" == "true" ]; then
            sudo apt update && sudo apt upgrade -y && sudo reboot
        fi
      ;;

    RENAME)
        while true; do
            read -p "Name your Raspberry Pi: " RPI_NAME
            read -p "You wish to name your Raspberry Pi '$RPI_NAME'. Correct? ([Y]es/[N]o/[Q]uit)" yn
            case $yn in
                [Yy]* ) sudo raspi-config nonint do_hostname $RPI_NAME; break;;
                [Qq]* ) RUNNING=false; exit 1;;
                [Nn]* ) continue;;
                * ) echo "Please answer yes(y), no(n), or quit(q).";;
            esac
        done
        echo "FANSHIM" > $STATE
        ;;

    FANSHIM)
        echo "Reached FANSHIM State."
        while true; do
            read -p "Do you wish to Install Fan SMIM Support ?' ([Y]es/[N]o/[Q]uit)" yn
            case $yn in
                [Yy]* ) INSTALL_FAN_SHIM="true"; break;;
                [Qq]* ) RUNNING=false; exit 1;;
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
      echo "BREAK" > $STATE
      ;;    

    BREAK)
      echo "Reaching BREAK State. Getting out of loop."
      RUNNING=false
      ;;
    *)
      echo "file doesn't exist, creating init state"
      echo "INIT" > $STATE
      ;;
  esac
done

rm $STATE
