#!/usr/bin/env bash

sudo rm -rf ./hypr
sudo rm -rf ./fish
sudo rm -rf ./alacritty
sudo rm -rf ./ags

cp -r ~/.config/hypr ./
cp -r ~/.config/fish ./
cp -r ~/.config/alacritty ./
cp -r ~/.config/ags ./
sudo rm -rf ./ags/tsconfig.json
sudo rm ./ags/types
