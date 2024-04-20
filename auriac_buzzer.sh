#!/bin/bash

LANGUAGE="en_US"

turn_down() {
    # liste toutes les applications diffusant du son et les mute
    pactl list sink-inputs |while read line; do \
        sink_num_check=$(echo "$line" | sed -rn 's/^Sink Input #(.*)/\1/p')
    
    if [ "$sink_num_check" != "" ]; then
        pactl set-sink-input-mute "$sink_num_check" true
    fi
}

turn_up() {
    # liste toutes les applications diffusant du son et les réactive
    pactl list sink-inputs |while read line; do \
        sink_num_check=$(echo "$line" | sed -rn 's/^Sink Input #(.*)/\1/p')

    if [ "$sink_num_check" != "" ]; then
        pactl set-sink-input-mute "$sink_num_check" false
    fi
}

read_on_tip() {
    mpg123 ./misc/song.mp3
}

read_on_tip_fun() {
    mpg123 ./misc/PetitBonhommeEnMousse.mp3
}

while true; do
    if [ $(gpioget pinctrl-bcm2835 2) -eq 0 ]; then
        turn_down

        if [ "$i" -eq 10 ]; then
            read_on_tip_fun
            i=0
        else
            read_on_tip
            i=$((i+1))
        fi

        turn_up

        # Anti processor killer
        sleep 0.3
        echo "Bien joué"
        clear
        echo "c'est reparti, $i pourboire"
    fi
done