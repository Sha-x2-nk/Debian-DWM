#!/bin/bash

GTKThemeSetup() {
    sudo nala install lxappearance -y

    cd themes-GTK/
    tar -xf Nordic-darker.tar.xz 
    sudo mv Nordic-darker /usr/share/themes/
    rm -rf Nordic-darker-v40/
    cd ..

    mkdir -p ~/.config
    mv .config/gtk-3.0 ~/.config/
}