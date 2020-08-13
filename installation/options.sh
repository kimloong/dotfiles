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
export ALL_PROXY=socks5://127.0.0.1:1080
yay -S --noconfirm --needed teamviewer
unset ALL_PROXY
# sudo teamviewer daemon start

echo -e "\e[1;33m     installed install other tool \e[0m"

echo -e "\e[1;33m installed prepare option \e[0m"
