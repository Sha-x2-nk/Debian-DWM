#!/bin/bash

picomSetup() {
    sudo nala install picom -y

    mkdir -p ~/.config
    cp -r .config/picom.conf ~/.config/
}