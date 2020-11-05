#!/bin/bash

#############################################
# Upload tool for escrotum-git
#############################################

# source login credentials for streamable, i.e.
# cat ./.secret
# username=<username>
# password=<password>
. ~/.config/escrotum/.secret


notify-send -u normal "Starting screencap, ctrl+alt+s to stop"

# run recording
escrotum "$HOME/escrotum-vid.webm" -rs

# exit if cancelled
if [ $? -eq 4 ]; then
    notify-send -u normal "Screencap aborted"
    exit 0
fi

# upload video and extract shortcode from output
# sample output: {"shortcode": "9dfu0t", "status": 1}
res=$(curl https://api.streamable.com/upload -u "$username":"$password" -F file=@"$HOME/escrotum-vid.webm" | python3 -c "import sys, json; print(json.load(sys.stdin)['shortcode'])")

# construct url for newly uploaded vid and copy to clipboard
echo "https://streamable.com/$res" | xclip -d :0 -selection "clipboard"

notify-send -u normal "Uploaded screencap: https://streamable.com/$res"
