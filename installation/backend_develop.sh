#!/bin/sh
set -e

echo -e "\e[1;33m installing backend develop \e[0m"

local_package_path="${HOME}/Downloads"
last_path=$(pwd)

# install jdk begin
echo -e "\e[1;33m     installing jdk \e[0m"
jdk_major=8

if [ ! -f /usr/bin/java ]; then

  jdk_file_path=$(find ${local_package_path} -type f -name "jdk-${jdk_major}*.tar.gz")
  jdk_filename=${jdk_file_path##*/}
  if [ -z "${jdk_filename}" ]; then
    echo -e "\e[1;31m     Can't find jdk local package in ${local_package_path}! \e[0m"
    exit 1
  fi

  jce_policy_file_path=$(find ${local_package_path} -type f -name "jce_policy-${jdk_major}.zip")
  jce_policy_filename=${jce_policy_file_path##*/}
  if [ -z "${jce_policy_filename}" ]; then
    echo -e "\e[1;31m     Can't find jce_policy local package in ${local_package_path}! \e[0m"
    exit 1
  fi

  cd "${local_package_path}"
  rm -rf jdk${jdk_major}
  git clone https://aur.archlinux.org/jdk${jdk_major}.git
  cd jdk${jdk_major}

  ln -s ${local_package_path}/jce_policy-${jdk_major}.zip ./
  sed -i '/^source\[1\]=\"manual:\/\/\${_srcfil\}\"/i\source[0]="jce_policy-${_major}.zip"' PKGBUILD
  makepkg -sri

  rm -rf jdk${jdk_major}
  cd ${last_path}

fi

echo -e "\e[1;33m     installed jdk \e[0m"
# install jdk end

# install maven begin
echo -e "\e[1;33m     installing maven \e[0m"
sudo pacman -S --noconfirm --needed maven
echo -e "\e[1;33m     installed maven \e[0m"
# install maven end

# install idea begin
echo -e "\e[1;33m     installing idea \e[0m"
if [ ! -f /usr/bin/idea ]; then
  yay -S --noconfirm --needed intellij-idea-ultimate-edition
  sudo ln -s -f /usr/bin/intellij-idea-ultimate-edition /usr/bin/idea
fi
echo -e "\e[1;33m     installed idea \e[0m"
# install idea end

echo -e "\e[1;33m     installing database tool \e[0m"
sudo pacman -S --noconfirm --needed mysql-workbench
if [ ! -f /usr/bin/mongodb-compass ]; then
  yay -S --noconfirm --needed mongodb-compass
fi

# redis-desktop-manager download source code too slow
# yay -S --noconfirm --needed redis-desktop-manager

echo -e "\e[1;33m     installed database tool \e[0m"

echo -e "\e[1;33m     installing docker \e[0m"
sudo pacman -S --noconfirm --needed docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF
echo -e "\e[1;33m     installed docker \e[0m"

echo -e "\e[1;33m     installing other tool \e[0m"
yay -S --noconfirm --needed postman-bin
# yay -S --noconfirm --needed astah-professional
echo -e "\e[1;33m     installed other tool \e[0m"

echo -e "\e[1;33m installed backend develop \e[0m"