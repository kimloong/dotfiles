#!/bin/sh
set -e

echo -e "\e[1;33m hosts \e[0m"
echo -e "\e[1;33m     start generate hosts \e[0m"
work_path=$(dirname $(readlink -f $0))

# sometime can't visit
# wget https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O ${work_path}/.google_hosts
# use mirror in China
wget https://scaffrey.coding.net/p/hosts/d/hosts/git/raw/master/hosts-files/hosts -O ${work_path}/.google_hosts

if [ -f "/etc/hosts" ]; then
  sudo mv /etc/hosts /etc/hosts.bak
fi

if [ -f "${work_path}/.customize_hosts" ]; then
  echo -e "\e[1;33m     append customize hosts \e[0m"
  sudo sh -c "${work_path}/.customize_hosts >> /etc/hosts"
fi
sudo sh -c "cat ${work_path}/.google_hosts >> /etc/hosts"

rm ${work_path}/.google_hosts

echo -e "\e[1;33m     finish generate hosts \e[0m"
