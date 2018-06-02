#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "[!] usage: ./cmin.sh <fuzzer-basename> "
    echo ""
    echo "> the fuzzer basename is the name you assigned the your master and slave fuzzers, minus the number."
    exit
fi

fuzzer_name=$1
cd syncdir
mkdir combined_queue
cp "${fuzzer_name}"*/queue/* combined_queue/
