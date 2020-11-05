#!/bin/bash


symlink() {
    # TODO; implement diff-check, on diff; update repo-dot with local (or the other direction), and continue symlinking
    printf "Symlinking '%s', to path '%s'\n" "repo/$1" "$HOME/$2"
    ln -s "$(realpath ./"$1")" "$HOME/$2"
}

symlink "bashrc" ".bashrc"

symlink "xinitrc" ".xinitrc"

symlink "Xmodmap" ".Xmodmap"

symlink "betterlockscreen/betterlockscreenrc" ".config/betterlockscreenrc"

# Ensure that '~/.config/i3/layouts' exists before symlinking i3-centric dots
mkdir -p "$HOME/.config/i3/layouts"
symlink "i3/config" ".config/i3/config"
symlink "i3/i3blocks.conf" ".config/i3/i3blocks.conf"
symlink "i3/i3exit" ".config/i3/i3exit"

# Symlink i3-layouts
symlink "i3/layouts/workspace2.json" ".config/i3/layouts/workspace2.json"
symlink "i3/layouts/workspace4.json" ".config/i3/layouts/workspace4.json"
symlink "i3/layouts/workspace5.json" ".config/i3/layouts/workspace5.json"

# Ensure that '~/.config/fish/functions' exists before symlinking fish-centric dots
mkdir -p "$HOME/.config/fish/functions"
symlink "fish/config.fish" ".config/fish/config.fish"
symlink "fish/fish_user_key_bindings.fish" ".config/fish/fish_user_key_bindings.fish"
symlink "fish/fish_variables" ".config/fish/fish_variables"
# Do fish-functions next
symlink "fish/functions/ls.fish" ".config/fish/functions/ls.fish"
symlink "fish/functions/monitor.fish" ".config/fish/functions/monitor.fish"
symlink "fish/functions/workflow.fish" ".config/fish/functions/workflow.fish"

# Ensure that parent dir exists before symlinking scripts
mkdir -p "$HOME/scripts"
symlink "scripts/workflow.sh" "scripts/workflow.sh"
symlink "scripts/monitorhandler.sh" "scripts/monitorhandler.sh"
symlink "scripts/mvworkspaceprimary.sh" "scripts/mvworkspaceprimary.sh"
symlink "scripts/testnotifications.sh" "scripts/testnotifications.sh"
symlink "scripts/i3-get-window-criteria" "scripts/i3-get-window-criteria"
symlink "scripts/escrotum-vid.sh" "scripts/escrotum-vid.sh"

# Ensure that dunst-config dir exists before symlinking
mkdir -p "$HOME/.config/dunst"
symlink "dunst/dunstrc" ".config/dunst/dunstrc"
