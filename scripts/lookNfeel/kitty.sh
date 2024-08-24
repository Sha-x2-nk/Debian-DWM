#!/bin/bash

kittySetup() {
    sudo nala install kitty -y

    rm -rf ~/.config/kitty
    mkdir -p ~/.config
    cp -r .config/kitty ~/.config/
}