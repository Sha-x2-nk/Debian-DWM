#!/bin/bash

rofiSetup() {
    sudo nala install rofi -y
    
    git clone https://github.com/lr-tech/rofi-themes-collection.git
    cd rofi-themes-collection/themes
    sudo mv * /usr/share/rofi/themes/

    cd ../..
    rm -rf rofi-themes-collection/

    mkdir -p ~/.config
    cp -r .config/rofi ~/.config
}