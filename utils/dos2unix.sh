#!/bin/sh
set -e

work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))

sed -i 's/\r//g' `grep "\r" -rl ${base_path}`