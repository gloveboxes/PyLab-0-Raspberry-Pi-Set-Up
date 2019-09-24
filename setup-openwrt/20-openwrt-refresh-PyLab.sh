INSTALL_DIR=~

rm -r -f $INSTALL_DIR/PyLab
git clone --depth=1 git://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git $INSTALL_DIR/PyLab

chmod +x $INSTALL_DIR/PyLab/setup-openwrt/*.sh
$INSTALL_DIR/PyLab/setup-openwrt/21-openwrt-load-ftp.sh
