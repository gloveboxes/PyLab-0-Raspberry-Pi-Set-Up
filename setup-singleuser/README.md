# Python Hands-on Labs Set Up

|Author|[Dave Glover](https://developer.microsoft.com/en-us/advocates/dave-glover?WT.mc_id=pycon-blog-dglover), Microsoft Cloud Developer Advocate |
|:----|:---|
|Platforms | Linux, macOS, Windows, Raspbian Buster|
|Services | [Azure IoT Central](https://docs.microsoft.com/en-us/azure/iot-central/?WT.mc_id=pycon-blog-dglover) |
|Tools| [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=pycon-blog-dglover)|
|Hardware | Raspberry Pi 2 or better, Raspberry Pi [Sense HAT](https://www.raspberrypi.org/products/sense-hat/)
|Language| Python|
|Date|As of September, 2019|

## Raspberry Pi Sense HAT

**Remove Raspberry Pi Sense HAT**

Raspberry Pi Buster Lite will not boot with the Raspberry Pi Sense HAT attached. Attach the Raspberry Pi Sense HAT after running the set up scripts.


## Raspberry Pi Install Bootstrap

Start an SSH session to the Raspberry Pi.

Run the following command to start the installation process.

```bash
bash -c "$(curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/setup.sh)"
```

## Installation Process

When prompted, select **Single User**, then follow the installation process.

## PyLab User

When the installation has completed login to the Raspberry Pi with the following creditentials:

    Login name: dev01
    Password: raspberry
