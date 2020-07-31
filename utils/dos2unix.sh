#!/bin/sh
set -e

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))

sed -i 's/\r//g' `grep "\r" -rl ${base_path}/scripts`
sed -i 's/\r//g' `grep "\r" -rl ${base_path}/installation`
sed -i 's/\r//g' `grep "\r" -rl ${base_path}/config`
sed -i 's/\r//g' `grep "\r" -rl ${base_path}/utils`
sed -i 's/\r//g'  ${base_path}/xprofile`
sed -i 's/\r//g'  ${base_path}/xhook`
