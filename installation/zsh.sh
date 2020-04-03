#!/bin/sh
set -e

echo -e "\e[1;33m zsh and oh-my-zsh \e[0m"
echo -e "\e[1;33m     installing \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/zsh"

if [ -d "${HOME}/.oh-my-zsh" ]; then
  echo -e "\e[1;33m     has been install \e[0m"
else
  sudo pacman -S --noconfirm --needed zsh
  # let skip run zsh on installing
  export RUNZSH=no
  # install oh-my-zsh
  # sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # in China use this
  sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"
fi

ln -s -f ${config_path}/zshrc ~/.zshrc

echo -e "\e[1;33m     installed \e[0m"
