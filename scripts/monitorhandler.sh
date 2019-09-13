#!/bin/bash

# monitor constants
home="DP2-1"
laptop="eDP1"
work="HDMI1"

# call command on output, given as $1, with output $2
xrandr_command() {
    #printf 'Executing: %s\n' "xrandr --output $1 $2"
    `xrandr --output $1 $2 $3`
}

enable_output() {
    xrandr_command $1 "--auto"
}

disable_output() {
    xrandr_command $1 "--off"
}

set_primary() {
    xrandr_command $1 "--primary"
}

set_right_of() {
    xrandr_command $1 "--right-of" $2
}

set_above() {
    xrandr_command $1 "--above" $2
}

display_help() {
    printf "Usage: monitor <WORKSPACE>\n"
    printf "Set up monitors to predefined setups {home, work, portable}\n"
}

if [[ $# -lt 1 || $1 =~ "--help" || $1 =~ "-h" ]]; then
    display_help
elif [[ $1 =~ home ]]; then 
    echo "Setting monitor-conf to home"
    enable_output $home
    set_primary $home
    enable_output $laptop
    # home is to the right of laptop
    set_right_of $home $laptop
    disable_output $work
elif [[ $1 =~ portable ]]; then
	echo "Setting monitor-conf to portable"
	enable_output $laptop
    set_primary $laptop
    disable_output $home
    disable_output $work
elif [[ $1 =~ work ]]; then
    echo "Setting monitor-conf to work"
    enable_output $laptop
    set_primary $laptop
    enable_output $work
    # work is to the right of laptop
    set_above $work $laptop
    disable_output $home
fi

