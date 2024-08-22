# Apply touchpad settings
touchpad_id=$(xinput list | grep -i "Touchpad" | grep -oP 'id=\K[0-9]+')
if [ -n "$touchpad_id" ]; then
    xinput set-prop "$touchpad_id" "libinput Tapping Enabled" 1 # tap to click
    xinput set-prop "$touchpad_id" "libinput Natural Scrolling Enabled" 1 # natural scrolling
else
    echo "Touchpad not found."
fi
exec picom &
exec nitrogen --restore &
exec slstatus &
exec dwm