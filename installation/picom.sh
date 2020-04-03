#!/bin/sh
set -e

echo -e "\e[1;33m picom \e[0m"
echo -e "\e[1;33m     installing\e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/picom"

# sudo pacman -S --noconfirm --needed picom
mkdir -p ~/.config/picom
ln -f -s ${config_path}/picom.conf ~/.config/picom/picom.conf

echo -e "\e[1;33m     installed \e[0m"
