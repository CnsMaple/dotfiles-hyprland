#!/usr/bin/env bash

pacman_packages_check() {
    if sudo pacman -Q $1 | grep $1; then
        echo "$1 is installed"
    else
        echo "$1 is not installed"
    fi
}

pacman_packages_check paru1