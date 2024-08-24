#!/bin/bash

# Function to add acpi_backlight=video if it doesn't exist
add_acpi_backlight() {
    if ! grep -q "acpi_backlight=" /etc/default/grub; then
        sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet "/GRUB_CMDLINE_LINUX_DEFAULT="quiet acpi_backlight=video "/' /etc/default/grub
    fi
}

# Function to replace * with video in acpi_backlight=*
replace_acpi_backlight() {
    if grep -q "acpi_backlight=*" /etc/default/grub; then
        sudo sed -i 's/acpi_backlight=\*/acpi_backlight=video/' /etc/default/grub
    fi
}

xorgSetup() {
    # XORG display server and additional libraries required by dwm
    sudo nala install xorg libx11-dev libxft-dev libxinerama-dev -y

    # Brightness
    # Adding acpi_backlight=video, it works for me, check other parameters on archwiki backlight page.
    # Added only quiet and acpi_backlight flags, removed the rest.. add later if you want to.
    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*"/GRUB_CMDLINE_LINUX_DEFAULT="quiet acpi_backlight=video"/' /etc/default/grub 
    sudo update-grub

    # Brightnessctl
    sudo nala install brightnessctl -y
}
