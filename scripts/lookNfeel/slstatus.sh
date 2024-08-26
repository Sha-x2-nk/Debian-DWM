#!/bin/bash

slstatusSetup() {
    mkdir -p ~/.local/bin
    rm -f ~/.local/bin/slstatus_battery ~/.local/bin/slstatus_vol
    cp scripts/lookNfeel/bin/* ~/.local/bin/

    rm -rf ~/.config/slstatus
    mkdir -p ~/.config
    cp -r .config/slstatus ~/.config/

    build_dir=$(pwd)

    cd ~/.config/slstatus
    sudo make clean install

    cd $build_dir
}