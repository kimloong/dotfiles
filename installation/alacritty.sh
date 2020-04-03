#!/bin/sh
set -e

echo -e "\e[1;33m kitty \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/alacritty"

sudo pacman -S --noconfirm --needed alacritty
mkdir -p ~/.config/alacritty
ln -f -s ${config_path}/alacritty.yml ~/.config/alacritty/alacritty.yml
echo -e "\e[1;33m     installed \e[0m"
