#!/bin/bash

wallpaperSetup() {
    sudo nala install nitrogen -y
    
    sudo mkdir -p /usr/share/wallpapers
    sudo cp avengers.png /usr/share/wallpapers/
    
    mkdir -p ~/.config
    cp -r .config/nitrogen ~/.config/
}