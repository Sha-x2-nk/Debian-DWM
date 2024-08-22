#!/bin/bash

audioSetup() {
    # Audio support in Linux
    sudo nala install pipewire -y
    systemctl --user --now enable pipewire pipewire-pulse
    # For managing audio output/input devices
    sudo nala install pavucontrol -y
}