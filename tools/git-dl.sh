#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Invalid argument count."
    echo "usage: ./git-dl.sh user/repo" && exit
fi

repo=$(basename $1)

echo "Cloning ${repo} into ${repo}-normal" 
git clone https://github.com/$1.git $(echo $1 | cut -d "/" -f 2)-normal &> /dev/null
echo "Cloning ${repo} into ${repo}-afl" 
git clone https://github.com/$1.git $(echo $1 | cut -d "/" -f 2)-afl &> /dev/null
echo "Done"
