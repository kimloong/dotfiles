#!/bin/sh
set -e

echo -e "\e[1;33m installing prepare \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
last_path=$(pwd)

cd ${work_path}
source env.sh
git config user.email ${PERSONAL_GIT_USER_EMAIL}
git config user.name ${PERSONAL_GIT_USER_NAME}
cd ${last_path}

sudo timedatectl set-ntp true
sudo pacman-mirrors -i -c China
sudo pacman -Ssy

# echo -e "\e[1;33m     setting language \e[0m"
# sudo locale -a
# sudo sed -i "s/^#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g" /etc/locale.gen
# sudo sed -i "s/^en_US.UTF-8 UTF-8/#en_US.UTF-8 UTF-8/g" /etc/locale.gen
# sudo locale-gen
# sudo localectl set-locale LANG=zh_CN.UTF-8
# echo -e "\e[1;33m     finish setting language \e[0m"

echo -e "\e[1;33m     generating xdg-user-dirs \e[0m"
sudo pacman -S --noconfirm --needed xdg-user-dirs
# export LANG=en_US
LC_ALL=C xdg-user-dirs-update
# export LANG=zh_CN.UTF-8
echo -e "\e[1;33m     generated xdg-user-dirs \e[0m"

# install xorg
echo -e "\e[1;33m     installing xorg \e[0m"
sudo pacman -S --noconfirm --needed xorg xorg-server xorg-xinit xorg-twm xorg-xdm xorg-xlsfonts
sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter

ln -s -f ${base_path}/Xresources ~/.Xresources
ln -s -f ${base_path}/xinitrc ~/.xinitrc
ln -s -f ${base_path}/xprofile ~/.xprofile
echo -e "\e[1;33m     installed xorg \e[0m"

# install common make tools
sudo pacman -S --noconfirm --needed go
if [ $(grep -c -e "GOPROXY" /etc/profile) -eq '0' ]; then
  sudo sh -c "echo '# export GOPROXY=https://goproxy.cn' >> /etc/profile"
  sudo sh -c "echo 'export GOPROXY=https://mirrors.aliyun.com/goproxy/' >> /etc/profile"
fi
source /etc/profile

sudo pacman -S --noconfirm --needed rust cmake
sudo pacman -S --noconfirm --needed nodejs npm electron
sudo pacman -S --noconfirm --needed python2

# install package and software
echo -e "\e[1;33m     installing package and software \e[0m"
sudo pacman -S --noconfirm --needed neovim openssh base-devel yay qt5-svg qt5-base qt5-tools flameshot
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

# chrome
yay -S --noconfirm --needed google-chrome
echo -e "\e[1;33m     installed package and software \e[0m"

# install audio package
sudo pacman -S --noconfirm --needed alsa-utils pulseaudio pulseaudio-alsa

# install network package
echo -e "\e[1;33m     installing network package \e[0m"
sudo pacman -S --noconfirm --needed netctl
echo -e "\e[1;33m     installed network package \e[0m"

echo -e "\e[1;33m installed prepare \e[0m"
