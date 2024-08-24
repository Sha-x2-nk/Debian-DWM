#!/bin/bash

picomSetup() {
    sudo nala install picom -y

    rm -f ~/.config/picom.conf
    mkdir -p ~/.config
    cp -r .config/picom.conf ~/.config/
}