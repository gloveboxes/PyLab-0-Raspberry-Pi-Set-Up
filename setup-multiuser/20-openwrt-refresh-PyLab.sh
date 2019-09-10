INSTALL_DIR=/mnt/sda2 && \
rm -r -f $INSTALL_DIR/PyLab && \
git clone --depth=1 git://github.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up.git $INSTALL_DIR/PyLab && \
chmod +x $INSTALL_DIR/PyLab/Lab-setup-multiuser/setup/*.sh && \
cd $INSTALL_DIR/PyLab/Lab-setup-multiuser/setup/
