#!/bin/bash

color=$(gpick --single --output)
if [ -n "$color" ]; then
    echo -n "$color" | xclip -selection clipboard
    notify-send "HEX code sent to your clipboard!"
fi
