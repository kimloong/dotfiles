#!/bin/sh
set -e

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))

find ${base_path} -type f -name "*.sh" -print0 | xargs -0 sed -i "s/sudo pacman -S/# sudo pacman -S/g"
find ${base_path} -type f -name "*.sh" -print0 | xargs -0 sed -i "s/yay -S/# yay -S/g"
