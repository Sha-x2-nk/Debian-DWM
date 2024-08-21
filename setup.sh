#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

apt update
apt upgrade -y

# Install nala
apt install nala -y

# Installing necessary programs
nala install firmware-iwlwifi wget nano build-essential make gcc gdb cmake git xorg libx11-dev libxft-dev libxinerama-dev kitty rofi lxappearance thunar nitrogen picom -y

# Installing Brave browser
nala install curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y

# VS Code
nala install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
nala install apt-transport-https
nala update
nala install code

# DWM
cd /home/$username
mkdir -p .config
cd .config
git clone https://git.suckless.org/dwm
cd dwm
make clean install
cd $builddir

# Copying .xinitrc
cp .xinitrc /home/$username/.