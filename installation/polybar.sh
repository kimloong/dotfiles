#!/bin/sh
set -e

echo -e "\e[1;33m installing polybar \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/polybar"

yay -S --noconfirm --needed polybar
# for pop calendar
yay -S --noconfirm --needed yad xdotool
ln -s -f ${config_path} ~/.config/polybar
chmod 755 ~/.config/polybar/launch.sh
chmod 755 ~/.config/polybar/popup-calendar.sh
mkdir -p ~/.local/share/polybar/log

echo -e "\e[1;33m installed polybar \e[0m"