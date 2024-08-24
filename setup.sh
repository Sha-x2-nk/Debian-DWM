# #!/bin/bash

# # Source the modular scripts
# source scripts/systemSettings/add_nonfree_contrib_apt.sh
# source scripts/systemSettings/touchpad_config.sh

# source scripts/drivers/wifi_bt.sh
# source scripts/drivers/xorg.sh
# source scripts/drivers/nvidia.sh
# source scripts/drivers/audio.sh

# source scripts/lookNfeel/dwm.sh
# source scripts/lookNfeel/GTK_theme.sh
# source scripts/lookNfeel/kitty.sh
# source scripts/lookNfeel/picom.sh
# source scripts/lookNfeel/rofi_theme.sh
# source scripts/lookNfeel/slstatus.sh
# source scripts/lookNfeel/wallpaper.sh

# source scripts/softwares/brave.sh
# source scripts/softwares/vscode.sh


# # Adding non-free and contrib repos to apt sources
# addNonfreeContribApt

# sudo apt update
# sudo apt upgrade -y

# # Install nala
# sudo apt install nala -y

# # Wifi & Bluetooth for Intel AX series interface
# WifiBtSetup
# # XORG display server and additional libraries required by dwm
# xorgSetup
# # Nvidia Graphic Drivers
# NvidiaInstallDrivers
# # Enabling dynamic boost for (Geforce RTX 30 series) GPUs
# NvidiaEnableDynamicBoost
# # Audio support in Linux
# audioSetup


# # Configure touchpad settings
# touchpadConfigure


# # Installing necessary development packages
# sudo nala install wget nano build-essential make gcc gdb cmake cmake-gui git -y
# # file manager
# sudo nala install thunar -y


# # dwm 
# dwmSetup
# # GTK theme
# GTKThemeSetup
# # Rofi theme
# rofiSetup
# # Wallpaper (using nitrogen)
# wallpaperSetup
# # Picom (compositor)
# picomSetup
# # slstatus 
# slstatusSetup
# # kitty setup
# kittySetup

# # Installing browser
# braveInstall
# # Installing vscode
# vscodeInstall

# # Copying .xinitrc
# rm -f ~/.xinitrc
# cp .xinitrc ~/

# # Copying .bash_profile, so that startx is called automatically upon login
# rm -f ~/.bash_profile
# cp .bash_profile ~/

# sudo reboot now

#!/bin/bash

# Get the current GRUB_CMDLINE_LINUX_DEFAULT value
current_cmdline=$(cat /etc/default/grub | grep GRUB_CMDLINE_LINUX_DEFAULT | awk '{print $3}')

# Check if acpi_backlight= exists
if [[ $current_cmdline =~ acpi_backlight= ]]; then
    # Replace the * part with video
    new_cmdline=$(echo "$current_cmdline" | sed 's/acpi_backlight=\*/acpi_backlight=video/')
else
    # Add acpi_backlight=video
    new_cmdline="$current_cmdline acpi_backlight=video"
fi

# Update the GRUB_CMDLINE_LINUX_DEFAULT value in the file
sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"$current_cmdline\"/GRUB_CMDLINE_LINUX_DEFAULT=\"$new_cmdline\"/" /etc/default/grub

# Update GRUB
sudo update-grub