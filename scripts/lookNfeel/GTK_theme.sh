#!/bin/bash

GTKThemeSetup() {
    sudo nala install lxappearance -y

    cd themes-GTK/
    tar -xf Nordic-darker.tar.xz 
    sudo rm -rf /usr/share/themes/Nordic-darker
    sudo mv Nordic-darker /usr/share/themes/
    rm -rf Nordic-darker-v40 Nordic-darker
    cd ..

    rm -rf ~/.config/gtk-3.0
    mkdir -p ~/.config
    cp -r .config/gtk-3.0 ~/.config/
}