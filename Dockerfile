FROM ubuntu:noble

# This is a recomended list from the official ST wiki.
# See: https://wiki.st.com/stm32mpu/wiki/PC_prerequisites
RUN apt-get update && apt-get install -y \
    gawk wget git git-lfs diffstat unzip texinfo gcc-multilib \
    chrpath socat cpio python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping python3-git python3-jinja2 \
    libsdl1.2-dev pylint xterm bsdmainutils libusb-1.0-0 bison flex \
    libssl-dev libgmp-dev libmpc-dev lz4 zstd repo libssl-dev \
    build-essential libncurses-dev libyaml-dev libssl-dev coreutils \
    bsdmainutils sed curl bc lrzsz corkscrew cvs subversion mercurial \
    nfs-common nfs-kernel-server libarchive-zip-perl dos2unix texi2html \
    libxml2-utils file

# Set the locale
RUN apt-get update && apt-get install -y locales \
 && rm -rf /var/lib/apt/lists/* \
 && locale-gen "en_US.UTF-8"
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Color terminal
ENV TERM=xterm-256color

RUN mkdir -p /sstate /build
WORKDIR /build

USER ubuntu

