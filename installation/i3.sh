#!/bin/sh
set -e

echo -e "\e[1;33m i3 \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/i3"

# sudo pacman -S --noconfirm --needed i3-wm i3lock xss-lock

mkdir -p ~/.config/i3
ln -f -s ${config_path}/config ~/.config/i3/config

mkdir -p ~/.local/share/i3/log

if [ $(grep -c -e "i3.desktop" /etc/lightdm/lightdm.conf) -eq '0' ]; then
  sudo sed -i '/^# greeter-session/i\greeter-session = i3.desktop' /etc/lightdm/lightdm.conf
fi

# use theme
# i3-style gruvbox -o ~/.config/i3/config
# themes is in /usr/lib/node_modules/i3-style/themes
# yay -S --noconfirm --needed i3-style

echo -e "\e[1;33m     installed \e[0m"
