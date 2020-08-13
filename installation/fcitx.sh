#!/bin/sh
set -e

# https://www.zhihu.com/question/333951476/answer/1280162871 后续改用fcitx5
echo -e "\e[1;33m fcitx \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/fcitx"

# install Chinese input method(contain wubi)
yay -S --noconfirm --needed fcitx fcitx-table-extra fcitx-configtool fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5

# link config
mkdir -p ~/.config/fcitx

ln -f -s ${config_path}/config ~/.config/fcitx/config
ln -f -s ${config_path}/profile ~/.config/fcitx/profile

mkdir -p ~/.config/fcitx/table
cp -rf ${config_path}/table ~/.config/fcitx/

rm -rf ~/.config/fcitx/conf
ln -f -s ${config_path}/conf ~/.config/fcitx/

if [ $(grep -c -e "fcitx" /etc/environment) -eq '0' ]; then
  sudo sh -c "echo 'GTK_IM_MODULE=fcitx' >> /etc/environment"
  sudo sh -c "echo 'QT_IM_MODULE=fcitx' >> /etc/environment"
  sudo sh -c "echo 'export XMODIFIERS=\"@im=fcitx\"' >> /etc/environment"
fi

echo -e "\e[1;33m     installed \e[0m"
