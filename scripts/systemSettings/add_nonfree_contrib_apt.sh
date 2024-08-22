#!/bin/bash

addNonfreeContribApt() {
    # Adding non-free and contrib repos 
    sudo sed -i -e 's|deb http://deb.debian.org/debian/ bookworm main non-free-firmware|deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware|' \
                -e 's|deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware|deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware|' \
                -e 's|deb http://security.debian.org/debian-security bookworm-security main non-free-firmware|deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware|' \
                -e 's|deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware|deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware|' \
                -e 's|deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware|deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware|' \
                -e 's|deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware|deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware|' \
                /etc/apt/sources.list
}