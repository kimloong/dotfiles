#!/bin/sh
set -e

echo -e "\e[1;33m dunst \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/dunst"

yay -S --noconfirm --needed libnotify dunst
mkdir -p ~/.config/dunst/
ln -s -f ${config_path}/dunstrc ~/.config/dunst/dunstrc
# First, use systemctl enable to set up the service to run at boot.
# systemctl enable --user dunst.service
# Next, start up the service using systemctl start.
# systemctl start --user dunst.service
# test
notify-send -a Chrome "This is a Test Summry" "This is Test Body"
echo -e "\e[1;33m     installed \e[0m"
