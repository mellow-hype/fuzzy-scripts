#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "[!] usage: ./cmin.sh <fuzzer-basename> \"target-cmd\""
    echo ""
    echo "> the fuzzer basename is the name you assigned the your master and slave fuzzers, minus the number."
    echo "> the target command string passed to afl must be double-quoted " 
    exit
fi

fuzzer_name=$1
target_cmd=$2
cd syncdir
mkdir combined_queue
cp "${fuzzer_name}"*/queue/* combined_queue/
afl-cmin -i combined_queue/ -o min_queue "${target_cmd}"
