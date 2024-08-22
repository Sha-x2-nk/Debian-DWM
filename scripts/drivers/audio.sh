#!/bin/bash

audioSetup() {
    # Audio support in Linux
    sudo nala install pipewire -y
    systemctl --user --now enable pipewire pipewire-pulse
}