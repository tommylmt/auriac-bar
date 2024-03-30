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
    read -n 1 input

    if [ "$input" = $KEY_CODE ]; then
        turn_down
        read_on_tip
        turn_up
    fi
done
