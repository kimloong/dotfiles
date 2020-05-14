#!/bin/sh
set -e

vpn_dev=ppp0
vpn_ip=$(ip address show dev ${vpn_dev}|grep inet|awk -F ' ' '{print $2}')

inner_ip_range_list=("192.168.0.0/16" "172.16.0.0/16" "172.24.0.0/16" "10.0.0.0/16")
inner_ip_range_list_count=${#inner_ip_range_list[@]}

for ((i=0; i<${inner_ip_range_list_count}; i++))
do
  inner_ip_range=${inner_ip_range_list[${i}]}
  echo -e "\e[1;33m add route ${inner_ip_range} \e[0m"
  sudo ip route replace ${inner_ip_range} via ${vpn_ip} dev ${vpn_dev}
done