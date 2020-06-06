#!/bin/sh
set -e

echo -e "\e[1;33m i3 \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/i3"
scripts_path="${base_path}/scripts/i3"

# yay -S --noconfirm --needed i3-wm i3lock xss-lock

mkdir -p ~/.config/i3
ln -f -s ${config_path}/config ~/.config/i3/config
sudo cp ${scripts_path}/i3starter.sh /usr/bin/i3starter
sudo chmod 755 /usr/bin/i3starter

mkdir -p ~/.local/share/i3/log

if [ $(grep -c -e "i3starter" /usr/share/xsessions/i3.desktop) -eq '0' ]; then
  sudo sed -i 's/^Exec=i3/# Exec=i3/g' /usr/share/xsessions/i3.desktop
  sudo sed -i '/^# Exec=i3/a\Exec=i3starter' /usr/share/xsessions/i3.desktop
fi

# use theme
# i3-style gruvbox -o ~/.config/i3/config
# themes is in /usr/lib/node_modules/i3-style/themes
# yay -S --noconfirm --needed i3-style

echo -e "\e[1;33m     installed \e[0m"
