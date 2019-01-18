#!/bin/sh

if [ ! -d pi-gen ]; then
	git clone https://github.com/RPi-Distro/pi-gen
fi

curl -Ls --output 04-buschfunk/files/install-wifi http://downloads.fars-robotics.net/wifi-drivers/install-wifi

git submodule update --remote


