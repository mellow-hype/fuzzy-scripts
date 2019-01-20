#!/usr/bin/env bash
base_dir=$pwd

# update sources and install dependencies
echo "[+] Installing dependencies and making config changes for afl..."
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y clang-3.8 build-essential llvm-3.8-dev gnuplot-nox
sudo update-alternatives --install /usr/bin/clang clang `which clang-3.8` 1
sudo update-alternatives --install /usr/bin/clang++ clang++ `which clang++-3.8` 1
sudo update-alternatives --install /usr/bin/llvm-config llvm-config `which llvm-config-3.8` 1
sudo update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer `which llvm-symbolizer-3.8` 1

# ensure system doesnt interfere with dumps
echo "[+] Enabling core dumps..."
echo core | sudo tee /proc/sys/kernel/core_pattern

# get and build afl
echo "[+] Installing American Fuzzy Lop..."
cd tools
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar xvf afl-latest.tgz &> /dev/null
cd afl-2*
make
make -C llvm_mode
sudo make install
echo "Done!"
echo ""

# other installs
echo "[+] Installing gdb and pwndbg..."
sudo apt-get install -y gdb 
git clone https://github.com/pwndbg/pwndbg.git
cd pwndbg 
./setup.sh
echo "Done!"

echo ""
echo "[+] Installing some other tools in case they aren't already..."
sudo apt-get install -y yasm vim git cmake autoconf libtool 
echo "Done!"
echo ""
