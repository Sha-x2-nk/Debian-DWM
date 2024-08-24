#!/bin/bash

WifiBtSetup() {
    # Wifi & Bluetooth for Intel AX series interface
    sudo apt --purge autoremove bluez -y
    sudo nala install firmware-iwlwifi -y
    sudo modprobe -r iwlwifi ; sudo modprobe iwlwifi

    sudo nala insall
}