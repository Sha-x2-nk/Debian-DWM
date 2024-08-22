#!/bin/bash

kittySetup() {
    sudo nala install kitty -y

    mkdir -p ~/.configx
    cp -r .config/kitty ~/.config/
}