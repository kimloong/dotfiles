#!/bin/sh
set -e

work_path=$(dirname $(readlink -f $0))
# install dunst
bash ${work_path}/dunst.sh || (
  echo "dunst failed"
  exit 1
)

# install java
bash ${work_path}/backend_develop.sh || (
  echo "backend develop.sh failed"
  exit 1
)

# install option software and package
bash ${work_path}/options.sh || (
  echo "prepare options failed"
  exit 1
)

sudo systemctl enable lightdm.service