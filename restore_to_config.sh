#!/usr/bin/env bash

sudo rm -rf ~/.config/hypr
sudo rm -rf ~/.config/fish
sudo rm -rf ~/.config/alacritty

sudo rm -rf ~/.config/noVNC

cp -r ./hypr ~/.config/
cp -r ./fish ~/.config/
cp -r ./alacritty ~/.config/

cp -r ./noVNC ~/.config/
