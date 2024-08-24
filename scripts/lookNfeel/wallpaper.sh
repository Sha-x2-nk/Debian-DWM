#!/bin/bash

wallpaperSetup() {
    sudo nala install nitrogen -y
    
    sudo rm -f /usr/share/wallpapers/avengers.png
    sudo mkdir -p /usr/share/wallpapers
    sudo cp avengers.png /usr/share/wallpapers/
    
    rm -rf ~/.config/nitrogen
    mkdir -p ~/.config
    cp -r .config/nitrogen ~/.config/
}