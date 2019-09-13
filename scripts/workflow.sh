#!/bin/bash

# For dispatching common scripts related to workflow configuration

network() {
    chwifi $1
}

monitor() {
    /home/user/scripts/monitorhandler.sh $1
}

connection() {
    # Preload sudo as it will be needed for chwifi
    printf "Network profile $1 is "
    netctl is-active $1
    if [[ $? -gt 0 ]]; then
        network $1
    fi
}

preload_sudo() {
    sudo echo
}

display_help() {
    printf "Usage: ./workflow.sh <environment>\nEnvironments:\n\thome\n\twork\n\tportable\n"
}

if [[ $# -eq 0 ]]; then
    display_help    
elif [[ $# -gt 0 ]]; then
    case "$1" in
        home)
            printf "Setting up $1 environment\n"
            preload_sudo
            monitor $1
            connection $1
            printf "Finished setting up $1 environment\n"
            ;;
        work)
            printf "Setting up $1 environment\n"
            preload_sudo
            monitor $1
            connection $1
            printf "Finished setting up $1 environment\n"
            ;;
        portable)
            printf "Setting up $1 environment\n"
            monitor $1
            printf "Finished setting up $1 environment\n"
            ;;
        *)
            printf "[ERROR] Could not parse '$1'. Please try again with legal arguments: [home, work, portable]\n"
            ;;
    esac
fi


