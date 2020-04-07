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

ln -s -f ${base_path}/Xresources ~/.Xresources
ln -s -f ${base_path}/xinitrc ~/.xinitrc
ln -s -f ${base_path}/xprofile ~/.xprofile

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
sudo pacman -S --noconfirm --needed neovim openssh yay qt5-svg qt5-base qt5-tools flameshot
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

# chrome
yay -S --noconfirm --needed google-chrome
# set default browser
sudo xdg-settings set default-web-browser google-chrome.desktop
xdg-mime default google-chrome.desktop text/html
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default google-chrome.desktop x-scheme-handler/about
# xdg-mime query default text/html
# xdg-mime query default x-scheme-handler/http
# xdg-mime query default x-scheme-handler/https
# xdg-mime query default x-scheme-handler/about

# l2tp
yay -S --noconfirm --needed networkmanager-l2tp networkmanager-strongswan
echo -e "\e[1;33m     installed package and software \e[0m"

echo -e "\e[1;33m installed prepare \e[0m"
