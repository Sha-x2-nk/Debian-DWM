#!/bin/bash

# Source the modular scripts
source scripts/systemSettings/add_nonfree_contrib_apt.sh
source scripts/systemSettings/touchpad_config.sh

source scripts/drivers/wifi_bt.sh
source scripts/drivers/xorg.sh
source scripts/drivers/nvidia.sh
source scripts/drivers/audio.sh

source scripts/lookNfeel/dwm.sh
source scripts/lookNfeel/GTK_theme.sh
source scripts/lookNfeel/kitty.sh
source scripts/lookNfeel/picom.sh
source scripts/lookNfeel/rofi_theme.sh
source scripts/lookNfeel/slstatus.sh
source scripts/lookNfeel/wallpaper.sh
source scripts/lookNfeel/nerd_fonts.sh

source scripts/softwares/brave.sh
source scripts/softwares/edge.sh
source scripts/softwares/vscode.sh

# Adding non-free and contrib repos to apt sources
addNonfreeContribApt

sudo apt update
sudo apt upgrade -y

# Install nala
sudo apt install nala -y

# XORG display server and additional libraries required by dwm
xorgSetup
# Nvidia Graphic Drivers
NvidiaInstallDrivers
# Enabling dynamic boost for (Geforce RTX 30 series) GPUs
NvidiaEnableDynamicBoost
# Audio support in Linux
audioSetup

# Configure touchpad settings
touchpadConfigure

# Installing necessary development packages
sudo nala install wget nano build-essential make gcc gdb cmake cmake-gui git -y
# file manager
sudo nala install thunar -y

# dwm 
dwmSetup
# # GTK theme
GTKThemeSetup
# Rofi theme
rofiSetup
# Wallpaper (using nitrogen)
wallpaperSetup
# Picom (compositor)
picomSetup
# Nerd Fonts
nerdFontsSetup
# slstatus 
slstatusSetup
# kitty setup
kittySetup

# Installing browser
# braveInstall
edgeInstall
# Installing vscode
vscodeInstall

# Wifi & Bluetooth for Intel AX series interface
WifiBtSetup

# Copying .xinitrc
rm -f ~/.xinitrc
cp .xinitrc ~/

# Copying .bash_profile, so that startx is called automatically upon login
rm -f ~/.bash_profile
cp .bash_profile ~/

sudo reboot now