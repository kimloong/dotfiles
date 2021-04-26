#!/bin/sh
set -e

echo -e "\e[1;33m installing v2ray \e[0m"

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_path="${base_path}/config/v2ray"

# https://github.com/FelisCatus/SwitchyOmega/releases

yay -S --noconfirm --needed v2ray
sudo mkdir -p /var/log/v2ray
sudo chmod 777 /var/log/v2ray
sudo systemctl enable v2ray
sudo systemctl start v2ray

sudo cp -f ${config_path}/v2ray-config.json /etc/v2ray/config.json
vnext_users_id_placeholder="{outbounds.settings.vnext.users.id}"
# use the under command to generate str_need_dec
# echo "the_vnext_users_id value"|openssl enc -aes-256-cfb -e -base64 -k "the_password" -salt
str_need_dec="U2FsdGVkX1+7qhqVrmTgHvStw3oNQebcKa5LyL0SlYL/gXGqG18oAoyjqiHtE1I6BGNu0rY="
read -s -p "Please enter vnext users id enc password > " password
vnext_users_id=$(echo $str_need_dec | openssl enc -aes-256-cfb -d -base64 -k $password -salt)

sudo sh -c "sed -i "s/${vnext_users_id_placeholder}/${vnext_users_id}/g" /etc/v2ray/config.json"

download_path="${HOME}/Downloads"
echo -e "\e[1;33m     Download Chrome proxy extension to ${download_path} \e[0m"
wget https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.5.19/SwitchyOmega_Chromium_2_5_19.crx -O ${download_path}/SwitchyOmega_Chromium.crx

echo -e "\e[1;33m installed v2ray \e[0m"
