#!/bin/bash

NvidiaInstallDrivers() {
    # Fetching CUDA link (nvidia-open not in apt yet [Aug 2024])
    wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb
    sudo nala update
    sudo nala install nvidia-open -y
    rm -f cuda-keyring_1.1-1_all.deb
}

NvidiaEnableDynamicBoost() {
    # Geforce RTX 30-series GPU supports it  
    sudo nala install nvidia-powerd -y
    sudo cp /usr/share/doc/nvidia-powerd/examples/nvidia-dbus.conf /etc/dbus-1/system.d/
    sudo cp /usr/share/doc/nvidia-powerd/examples/nvidia-powerd.service /lib/systemd/system/
    sudo sed -i 's|/usr/bin/nvidia-powerd|/usr/sbin/nvidia-powerd|' /lib/systemd/system/nvidia-powerd.service
    sudo systemctl enable nvidia-powerd
}