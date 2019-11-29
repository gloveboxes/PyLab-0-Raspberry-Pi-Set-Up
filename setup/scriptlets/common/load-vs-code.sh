#!/bin/bash

rm -r -f ~/ftp/software
mkdir -p ~/ftp/software/linux
mkdir -p ~/ftp/software/macos
mkdir -p ~/ftp/software/windows

echo 'downloading Visual Studio Code for Ubuntu starting'
cd ~/ftp/software/linux
rm * -f

wget  https://go.microsoft.com/fwlink/?LinkID=760868
mv index.html?LinkID=760868 vs-code-debian-amd64.deb

wget  https://go.microsoft.com/fwlink/?LinkID=760867
mv index.html?LinkID=760867 vs-code-linux-x86_64.rpm

wget  https://go.microsoft.com/fwlink/?LinkID=620884
mv index.html?LinkID=620884 vs_code-stable.tar.gz

echo 'downloading Visual Studio Code for Windows starting'
cd ~/ftp/software/windows
rm * -f

wget  https://aka.ms/win32-x64-user-stable
mv win32-x64-user-stable vs-code-windows-x64.exe

echo 'downloading Visual Studio Code for macOS starting'
cd ~/ftp/software/macos
rm * -f

wget  https://go.microsoft.com/fwlink/?LinkID=620882
mv index.html?LinkID=620882 vs-code-macos.zip
