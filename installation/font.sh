#!/bin/sh
set -e

# install font
echo -e "\e[1;33m font \e[0m"
echo -e "\e[1;33m     installing \e[0m"

sudo pacman -S --noconfirm --needed fontconfig
sudo pacman -S --noconfirm --needed noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -S --noconfirm --needed wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
# sudo pacman -S --noconfirm --needed adobe-source-code-pro-fonts
export ALL_PROXY=socks5://127.0.0.1:1080
sudo pacman -S --noconfirm --needed nerd-fonts-source-code-pro
unset ALL_PROXY
# sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-font-awesome
# icon and emoji font,use for polybar
sudo pacman -S --noconfirm --needed xorg-fonts-misc

echo -e "\e[1;33m     installed \e[0m"
