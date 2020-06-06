#!/bin/sh
set -e

echo -e "\e[1;33m installing rofi \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/rofi"

yay -S --noconfirm --needed rofi
ln -s -f ${config_path} ~/.config/rofi

echo -e "\e[1;33m installed rofi \e[0m"
