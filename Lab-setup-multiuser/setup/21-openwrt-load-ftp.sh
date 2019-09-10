
INSTALL_DIR=/mnt/sda2
FTP_DIR=/mnt/sda2/lab

rm -r -f $FTP_DIR*
mkdir -p $FTP_DIR/software/linux
mkdir -p $FTP_DIR/software/macos
mkdir -p $FTP_DIR/software/windows
mkdir -p $FTP_DIR/scripts
mkdir -p $FTP_DIR/PyLab

echo "Copy SSH Scripts"
cp -r $INSTALL_DIR/PyLab/Lab-setup-multiuser/scripts $FTP_DIR/

INSTALL_DIR=/mnt/sda2 && \
git clone --depth=1 git://github.com/gloveboxes/PyLab-1-Debugging-a-Python-Internet-of-Things-Application.git $FTP_DIR/PyLab/PyLab-1-Python-Debug

INSTALL_DIR=/mnt/sda2 && \
git clone --depth=1 git://github.com/gloveboxes/PyLab-2-Python-Azure-IoT-Central-and-Docker-Container-Debugging.git $FTP_DIR/PyLab/PyLab-2-Docker-Debug

echo 'downloading Visual Studio Code for Ubuntu starting'
cd $FTP_DIR/software/linux
rm * -f

wget  https://go.microsoft.com/fwlink/?LinkID=760868
mv index.html?LinkID=760868 code_1.38.0-1567547996_amd64.deb

wget  https://go.microsoft.com/fwlink/?LinkID=760867
mv index.html?LinkID=760867 code-1.38.0-1567548134.el7.x86_64.rpm

wget  https://go.microsoft.com/fwlink/?LinkID=620884
mv index.html?LinkID=620884 code-stable-1567547931.tar.gz

echo 'downloading Visual Studio Code for Windows starting'
cd $FTP_DIR/software/windows
rm * -f

wget  https://aka.ms/win32-x64-user-stable
mv win32-x64-user-stable VSCodeUserSetup-x64-1.38.0.exe

echo 'downloading Visual Studio Code for macOS starting'
cd $FTP_DIR/software/macos
rm * -f

wget  https://go.microsoft.com/fwlink/?LinkID=620882
mv index.html?LinkID=620882 VSCode-darwin-stable.zip
