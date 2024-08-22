#!/bin/bash

touchpadConfigure() {

    # Get the device ID of the touchpad by querying xinput
    sudo nala install xinput -y

    # !!Included this script in .xinitrc !!

    # touchpad_id=$(xinput list | grep -i "Touchpad" | grep -oP 'id=\K[0-9]+')
    # # Check if the touchpad ID was found
    # if [ -n "$touchpad_id" ]; then
    #     xinput set-prop $(touchpad_id) "libinput Tapping Enabled" 1 # tap to click
    #     xinput set-prop $(touchpad_id) "libinput Natural Scrolling Enabled" 1 # natural scrolling
    # else
    #     echo "Touchpad not found."
    # fi
}