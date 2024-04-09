#!/usr/bin/env bash

sudo rm -rf ./hypr
cp -r ~/.config/hypr ./

sudo rm -rf ./fish
cp -r ~/.config/fish ./

sudo rm -rf ./alacritty
cp -r ~/.config/alacritty ./

# sudo rm -rf ./ags
# cp -r ~/.config/ags ./
# sudo rm -rf ./ags/tsconfig.json
# sudo rm ./ags/types
