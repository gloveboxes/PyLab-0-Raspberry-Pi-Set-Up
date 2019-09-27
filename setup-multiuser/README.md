# Python Hands-on Labs Set Up

|Author|[Dave Glover](https://developer.microsoft.com/en-us/advocates/dave-glover?WT.mc_id=pycon-blog-dglover), Microsoft Cloud Developer Advocate |
|:----|:---|
|Platforms | Linux, macOS, Windows, Raspbian Buster|
|Services | [Azure IoT Central](https://docs.microsoft.com/en-us/azure/iot-central/?WT.mc_id=pycon-blog-dglover) |
|Tools| [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=pycon-blog-dglover)|
|Hardware | [Raspberry Pi 4. 4GB](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/) model required for 20 Users. Raspberry Pi [Sense HAT](https://www.raspberrypi.org/products/sense-hat/), Optional: Raspberry Pi [case](https://shop.pimoroni.com/products/pibow-coupe-4?variant=29210100138067), [active cooling fan](https://shop.pimoroni.com/products/fan-shim)
|**USB3 SSD Drive**| To support up to 20 users per Raspberry Pi you need a **fast** USB3 SSD Drive to run Raspbian Buster Linux on. A 120 USB3 SSD drive will be more than sufficient. These are readily available from online stores.
|Language| Python|
|Date|As of September, 2019|

[OpenWRT and the Linksys WRT 1900 ACS Router](https://github.com/gloveboxes/Linksys-WRT-1900-ACS-with-Huawei-E3372-Hi-Link-LTE-Dongle)

## Raspberry Pi Sense HAT

**Remove Raspberry Pi Sense HAT**

Raspberry Pi Buster Lite will not boot with the Raspberry Pi Sense HAT attached. Attach the Raspberry Pi Sense HAT after running the set up scripts.

<!-- ## Update Raspberry Pi

```bash
sudo apt update && sudo apt upgrade -y && sudo reboot
``` -->

## Raspberry Pi Install Bootstrap

Start an SSH session to the Raspberry Pi.

Run the following command to start the installation process.

```bash
bash -c "$(curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/setup.sh)"
```

## Install Remote SSH on the Raspberry Pi

It is critical that Lab attendees install the same version of VS Code (from the FTP Server) so it matches the VS Code Server Components installed on the Raspberry Pi. Otherwise 200MB per User will be downloaded when they start a Remote SSH Session.

From your desktop:

1. From your internet browser, link to **FTP://\<raspberry pi name>.local**, download and install Visual Studio Code.

2. Install Remote SSH and Python Extensions

    ```bash
    code --install-extension ms-vscode-remote.remote-ssh
    code --install-extension ms-python.python
    ```

3. Start Visual Studio Code
4. Start Remote SSH to the Raspberry Pi. This will install the Remote SSH Components on the Raspberry Pi. Add an SSH config:

    ```bash
    Host raspberrypi
        HostName <Raspberry Pi Name>.local
        User pi
    ```

5. Enabled the Python Extension on SSH
6. Close Remote SSH Connection to the Raspberry Pi
7. **Reboot the Raspberry Pi to make sure all files and locks closed**

### Deploy Remote SSH Server  to all users

Login to the Raspberry Pi and running the following command.

```bash
~/PyLab/Lab-setup/setup/5-copy-remote-ssh.sh
```

## Installing PyLab Components Manually

You can also run each component manually.

### Install Core Libraries

```bash
~/PyLab/Lab-setup/setup/11-install-core.sh
```

### Refresh PyLab Content

```bash
~/PyLab/Lab-setup/setup/12-refresh-PyLab.sh
```

### Reload FTP Server

```bash
~/PyLab/Lab-setup/setup/13-load-ftp.sh
```

### Create Users

```bash
~/PyLab/Lab-setup/setup/14-create-users.sh
```

### Deploy Lab Content to all users

```bash
~/PyLab/Lab-setup/setup/15-copy-lab.sh
```

### Build Lab Docker Images

```bash
~/PyLab/Lab-setup/setup/16-build-images.sh
```

### Copy Remote SSH Libraries

```bash
~/PyLab/Lab-setup/setup/17-copy-remote-ssh.sh
```

### Clean Up Lab

Delete all devNN users and remove files and reset nopasswd

```bash
~/PyLab/Lab-setup/setup/18-cleanup-lab.sh
```
