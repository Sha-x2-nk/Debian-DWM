#!/bin/bash

xorgSetup() {
    # XORG display server and additional libraries required by dwm
    sudo nala install xorg libx11-dev libxft-dev libxinerama-dev -y

}