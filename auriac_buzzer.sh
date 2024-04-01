#!/bin/bash

turn_down() {
    initial_volume=$(amixer get Master | grep -oE "[0-9]+%" | head -n 1)
    amixer -q set Master $DOWN_VOLUME
}

turn_up() {
    amixer -q set Master "$initial_volume"
}

read_on_tip() {
    mpg123 /home/Music/song.mp3
}

while true; do
    if [ $(gpio read $KEY_CODE) -eq 1 ]; then
        turn_down
        read_on_tip
        turn_up

        # Anti processor killer
        sleep 0.3
    fi
done
