#!/bin/bash

nerdFontsSetup() {
    sudo nala install unzip -y

    unzip scripts/lookNfeel/FiraCode.zip

    sudo mv FiraCodeNerdFont* /usr/share/fonts
    rm -f LICENSE README.md 
    
    sudo fc-cache -f
}