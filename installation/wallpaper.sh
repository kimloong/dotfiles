#!/bin/sh
set -e

echo -e "\e[1;33m wallpaper \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
scripts_path="${base_path}/scripts/wallpaper"

yay -S --noconfirm --needed feh

# create wallpaper dir
mkdir -p ~/wallpaper

ln -s -f ${scripts_path}/random_wallpaper.sh ~/wallpaper/wallpaper.sh
chmod 755 ~/wallpaper/wallpaper.sh

echo -e "\e[1;33m     installed \e[0m"
