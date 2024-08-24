#!/bin/bash

dwmSetup() {
    rm -rf ~/.config/dwm
    mkdir -p ~/.config
    cp -r .config/dwm ~/.config/

    build_dir=$(pwd)

    cd ~/.config/dwm
    sudo make clean install

    cd $build_dir
}