#!/usr/bin/env bash

# pid=$(ps -ef | awk '$8=="awesome" {print $2}')
pid=$(pidof .awesome-wrapped)
max_str_length=8192

sudo strace -e trace=write -s${max_str_length} -p${pid} 2>&1 \
    | grep --line-buffered --color=no "write([12], " \
    | sed -u 's/write([12], "\(.*\)", [0-9]\+) \+= [0-9]\+$/\1/g' \
    | sed -u 's/\\n/\n/g' \
    | sed -u 's/\\t/\t/g'

echo $pid

