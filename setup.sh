#!/bin/bash


symlink() {
    # TODO; implement diff-check, on diff; update repo-dot with local (or the other direction), and continue symlinking
    printf "Symlinking '%s', to path '%s'\n" "repo/$1" "$HOME/$2"
    ln -s "$(realpath ./"$1")" "$HOME/$2"
}

symlink "bashrc" ".bashrc"

# Ensure that '~/.config/i3' exists before symlinking i3-centric dots
mkdir -p "$HOME/.config/i3"
symlink "i3/config" ".config/i3/config"
symlink "i3/i3blocks.conf" ".config/i3/i3blocks.conf"
symlink "i3/i3exit" ".config/i3/i3exit"

# Ensure that parent dir exists before symlinking scripts
mkdir -p "$HOME/scripts"
symlink "scripts/workflow.sh" "scripts/workflow.sh"
symlink "scripts/monitorhandler.sh" "scripts/monitorhandler.sh"
symlink "scripts/mvworkspaceprimary.sh" "scripts/mvworkspaceprimary.sh"
symlink "scripts/testnotifications.sh" "scripts/testnotifications.sh"
symlink "scripts/i3-get-window-criteria" "scripts/i3-get-window-criteria"

