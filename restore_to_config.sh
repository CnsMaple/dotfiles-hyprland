#!/usr/bin/env bash

sudo rm -rf ~/.config/hypr
cp -r ./hypr ~/.config/

sudo rm -rf ~/.config/fish
cp -r ./fish ~/.config/

sudo rm -rf ~/.config/alacritty
cp -r ./alacritty ~/.config/

sudo rm -rf ~/.config/ags
cp -r ./ags ~/.config/

# sudo rm -rf ~/.config/noVNC
# cp -r ./noVNC ~/.config/
# ~/.config/noVNC/utils/novnc_proxy
