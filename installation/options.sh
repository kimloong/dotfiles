#!/bin/sh
set -e

echo -e "\e[1;33m installing prepare option \e[0m"
# install music player
echo -e "\e[1;33m     installing music player \e[0m"
yay -S --noconfirm --needed netease-cloud-music
echo -e "\e[1;33m     installed music player\e[0m"

# install office
echo -e "\e[1;33m     installing office \e[0m"
yay -S --noconfirm --needed wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts
sudo ln -s /usr/bin/wps /usr/bin/word
sudo ln -s /usr/bin/et /usr/bin/excel
sudo ln -s /usr/bin/wpp /usr/bin/ppt
echo -e "\e[1;33m     installed office \e[0m"

echo -e "\e[1;33m     installing archiving and compression tool \e[0m"
# install archiving and compression tool
yay -S --noconfirm --needed zip unzip rar gzip atool
echo -e "\e[1;33m     installed archiving and compression tool \e[0m"

echo -e "\e[1;33m     installing install other tool \e[0m"
# install other tool
# vs code
yay -S --noconfirm --needed code

# install teamviewer
# 使用时需要先到官网登录信任设置，否则会提示Not ready,please check your connection
# teamviewer.com
yay -S --noconfirm --needed teamviewer
# sudo teamviewer daemon start

# command: deepin-screenshot
yay -S --noconfirm --needed deepin-screenshot

echo -e "\e[1;33m     installed install other tool \e[0m"
export LANG=en_US
sudo pacman -S xdg-user-dirs-gtk
xdg-user-dirs-gtk-update

echo -e "\e[1;33m installed prepare option \e[0m"
