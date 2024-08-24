#!/bin/bash

WifiBtSetup() {
    # Wifi & Bluetooth for Intel AX series interface
    sudo apt --purge autoremove bluez -y
    sudo nala install firmware-iwlwifi -y
    sudo modprobe -r iwlwifi ; sudo modprobe iwlwifi

    sudo nala install network-manager iwd -y
    sudo cp .config/iwd.conf /etc/NetworkManager/conf.d/
    # Disable wpa_supplicant service, will use iwd now
    sudo systemctl stop NetworkManager.service
    sudo systemctl mask --now wpa_supplicant
    sudo systemctl restart NetworkManager.service
}