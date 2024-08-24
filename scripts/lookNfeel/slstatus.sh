#!/bin/bash

slstatusSetup() {
    rm -rf ~/.config/slstatus
    mkdir -p ~/.config
    cp -r .config/slstatus ~/.config/

    build_dir=$(pwd)

    cd ~/.config/slstatus
    sudo make clean install

    cd $build_dir
}