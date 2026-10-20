#!/bin/bash

set -ouex pipefail

REMOVE=(
    firefox
    firefox-langpacks
    gnome-tour
    yelp
    abrt
    abrt-desktop
    abrt-cli
    abrt-addon-ccpp
    abrt-addon-kerneloops
    abrt-addon-vmcore
    abrt-addon-xorg
    abrt-dbus
    abrt-libs
    abrt-tui
    gnome-classic-session
    gnome-shell-extension-apps-menu
    gnome-shell-extension-launch-new-instance
    gnome-shell-extension-places-menu
    gnome-shell-extension-window-list
    gnome-shell-extension-background-logo
)

for pkg in "${REMOVE[@]}"; do
    if rpm -q "$pkg" >/dev/null 2>&1; then
        dnf5 -y remove "$pkg"
    fi
done

systemctl enable podman.socket
