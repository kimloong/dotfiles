#!/bin/sh
set -e

work_path=$(dirname $(readlink -f $0))
last_path=$(pwd)

cd ${work_path}
source ${work_path}/env.sh
git config user.email ${PERSONAL_GIT_USER_EMAIL}
git config user.name ${PERSONAL_GIT_USER_NAME}
cd ${last_path}

# prepare and initial system
#bash ${work_path}/prepare.sh || (
#  echo "prepare failed"
#  exit 1
#)

# install v2ray
#bash ${work_path}/v2ray.sh || (
#  echo "greatwall failed"
#  exit 1
#)

# install font
bash ${work_path}/font.sh || (
  echo "font failed"
  exit 1
)

# install random wallpaper
#bash ${work_path}/wallpaper.sh || (
#  echo "wallpaper failed"
#  exit 1
#)

# install fcitx
bash ${work_path}/fcitx.sh || (
  echo "fcitx failed"
  exit 1
)

# install picom
#bash ${work_path}/picom.sh || (
#  echo "picom failed"
#  exit 1
#)

# install rofi
#bash ${work_path}/rofi.sh || (
#  echo "rofi failed"
#  exit 1
#)

# install polybar
#bash ${work_path}/polybar.sh || (
#  echo "polybar failed"
#  exit 1
#)

# install deepin
bash ${work_path}/deepin.sh || (
  echo "deepin failed"
  exit 1
)

# install ranger
bash ${work_path}/ranger.sh || (
  echo "ranger failed"
  exit 1
)

# install dunst
#bash ${work_path}/dunst.sh || (
#  echo "dunst failed"
#  exit 1
#)

# install zsh
bash ${work_path}/zsh.sh || (
  echo "zsh failed"
  exit 1
)

# install java
#bash ${work_path}/backend_develop.sh || (
#  echo "backend develop.sh failed"
#  exit 1
#)

# install option software and package
#bash ${work_path}/options.sh || (
#  echo "prepare options failed"
#  exit 1
#)
