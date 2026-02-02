# Docker Image for OpenSTLinux Build (Yocto Linux)

This is an Ubuntu image that contains necessary packages to build OpenSTLinux.
The advantage is that you can build OpenSTLinux without installing Ubuntu
on your machine. This is very useful for Windows and other Linux (e.g. Arch) users.

I successfully build STM32MP2 Distribution Package OpenSTLinux distribution
`openstlinux-6.6-yocto-scarthgap-mpu-v25.08.27` using this image.

## Build this Docker Image
Go into this folder and run

```bash
sudo docker build --tag 'openstlinux_docker' .
```

## Run the Docker Image

```bash
    docker run -it \
        --volume=${PWD}:/build \
        --volume=/my/sstate/dir:/sstate \
        openstlinux_docker \
        /bin/bash
```

or

```bash
    docker run -it \
        --volume=${PWD}:/build \
        openstlinux_docker \
        /bin/bash
```

if you don't care about sstate cache (one-off builds).

## Download and Build OpenSTLinux

For instructions on how to build this Yocto Linux distribution, please refer to
<https://wiki.st.com/stm32mpu/wiki/STM32MPU_Distribution_Package>.

Set your git credentials

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

Clone the distribution

```bash
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-6.6-yocto-scarthgap-mpu-v25.08.27
repo sync
```

Modify the `stm32mp25-disco` with a valid machine found at <https://wiki.st.com/stm32mpu/wiki/OpenSTLinux_distribution> and build

```bash
DISTRO=openstlinux-weston MACHINE=stm32mp25-disco source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
```

It may take an hour or more depending on your hardware.

## Update This
I will for sure never update this repo.
If you want an up to date docker image, you will have to update it yourself.

- Go to <https://wiki.st.com/stm32mpu/wiki/PC_prerequisites> and look for the newest supported Ubuntu. That is the first line in the [./Dockerfile](./Dockerfile).
- On the same page, look at the `sudo apt-get install` stuff and update the `sudo apt-get install` section in the [./Dockerfile](./Dockerfile).
- Go to <https://github.com/STMicroelectronics/oe-manifest/releases> and check the latest release. Use it to initialize or update the `repo`.

