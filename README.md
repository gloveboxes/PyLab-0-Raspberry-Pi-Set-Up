# PyCon 2019

## Debug Python with Visual Studio Code: Tips and Tricks Tutorial

![](resources/python-loves-vscode-raspberrypi.jpg)

Follow me on Twitter [@dglover](https://twitter.com/dglover)

<br/>

|Author|[Dave Glover](https://developer.microsoft.com/en-us/advocates/dave-glover?WT.mc_id=pycon-blog-dglover), Microsoft Cloud Developer Advocate |
|:----|:---|
|Platforms | Linux, macOS, Windows, Raspbian Buster|
|Services | [Azure IoT Central](https://docs.microsoft.com/en-us/azure/iot-central/?WT.mc_id=pycon-blog-dglover) |
|Tools| [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=pycon-blog-dglover)|
|Hardware | [Raspberry Pi 4. 4GB](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/) model required for 20 Users. Raspberry Pi [Sense HAT](https://www.raspberrypi.org/products/sense-hat/), Optional: Raspberry Pi [case](https://shop.pimoroni.com/products/pibow-coupe-4?variant=29210100138067), [active cooling fan](https://shop.pimoroni.com/products/fan-shim)
|**USB3 SSD Drive**| To support up to 20 users per Raspberry Pi you need a **fast** USB3 SSD Drive to run Raspbian Buster Linux on. A 120 USB3 SSD drive will be more than sufficient. These are readily available from online stores.
|Language| Python|
|Date|As of September, 2019|

## Tutorial Description

### Python Debugging: Pro Tips and Not-So-Obvious Tricks

If you are anything like me, when you started with Python 'print' was the debugger of choice. But you likely found that was slow, tedious, and didn't cut it for more complex problems.

Let’s dive into methods for debugging remote python in environments such as CircuitPython, Raspberry Pi, Docker containers, remote Linux Servers, and Jupyter Notebooks.

You’ll learn how to sync code to devices, attach debuggers, and step through your code. And existing (or newly forged) Jupyter fans will learn tips to debug your notebooks.

This fun session covers a range of scenarios and empowers you to supercharge your debugging techniques!

## Raspberry Pi Install Bootstrap

```bash
bash -c "$(curl https://raw.githubusercontent.com/gloveboxes/PyLab-0-Raspberry-Pi-Set-Up/master/setup.sh)"
```

## Personal Computer Requirements

1. Bring your own laptop running one of the follow Operating Systems:

    - Linux
        - See [Installing Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux)
    - macOS
    - Windows 10 (1809+).
        - Install the OpenSSH Client from PowerShell as Administrator.

        ```bash
        Add-WindowsCapability -Online -Name OpenSSH.Client
        ```

## Debugging Web and Docker Container Apps on a Raspberry Pi

![](resources/iot-hol-banner.png)

- [PyLab 1: Raspberry Pi, Debugging a Python Internet of Things Application](https://gloveboxes.github.io/PyLab-1-Debugging-a-Python-Internet-of-Things-Application/)
- [PyLab 2: Raspberry Pi, Azure IoT Central, and Docker Container Debugging](https://gloveboxes.github.io/PyLab-2-Python-Azure-IoT-Central-and-Docker-Container-Debugging/)


<!-- ## Dev.to (Works with Google Translate)

- [Lab 1: Remote Debugging a Raspberry Pi Flask Web Application]()

- [Lab 2: Raspberry Pi, Python, IoT Central, and Docker Container Debugging]() -->