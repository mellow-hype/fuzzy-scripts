#!/usr/bin/env bash
if [ "$#" -ne 1 ]; then
    echo "usage: init-target.sh <target-name>" 
    exit
fi

target=$1
target_dir="$HOME/targets/$target"

mkdir -p "$target_dir"
mkdir -p "$target_dir/inputs"
mkdir -p "$target_dir/syncdir"
mkdir -p "$target_dir/src"
script_dir=$(dirname $0)
cp "$script_dir"/cmin.sh "$target_dir"/cmin.sh

