#!/bin/bash

kittySetup() {
    sudo nala install unzip -y

    unzip FiraCode.zip

    sudo mv FiraCodeNerdFont* /usr/share/fonts
    rm -f LICENSE README.md 
    
    sudo fc-cache -fv
}