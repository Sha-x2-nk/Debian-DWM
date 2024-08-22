#!/bin/bash

WifiBtSetup() {
    # Wifi & Bluetooth for Intel AX series interface
    sudo nala install firmware-iwlwifi -y
    sudo modprobe -r iwlwifi ; sudo modprobe iwlwifi
}