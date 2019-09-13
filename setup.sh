#!/bin/bash


symlink() {
    printf "Symlinking '%s', to path '%s'\n" "repo/$1" "$HOME/$2"
    ln -s "$(realpath ./"$1")" "$HOME/$2"
}

symlink "bashrc" ".bashrc"

# Ensure that parent dir exists before symlinking scripts
mkdir -p "$HOME/scripts"
symlink "scripts/workflow.sh" "scripts/workflow.sh"
symlink "scripts/monitorhandler.sh" "scripts/monitorhandler.sh"
symlink "scripts/mvworkspaceprimary.sh" "scripts/mvworkspaceprimary.sh"
symlink "scripts/testnotifications.sh" "scripts/testnotifications.sh"
symlink "scripts/i3-get-window-criteria" "scripts/i3-get-window-criteria"

