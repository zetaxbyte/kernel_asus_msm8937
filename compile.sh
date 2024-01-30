#!/bin/bash

echo -e "\033[93m==========================="
echo -e "\033[93m= START COMPILING KERNEL  ="
echo -e "\033[93m==========================="

echo -e -n "\033[93m\033[104mPRESS ENTER TO CONTINUE\033[0m"
read P
echo $P

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}LOADING-_-....${normal}"

DEFCONFIG="X00P_defconfig"
export KBUILD_BUILD_USER=t.me/@zetaxbyte
export KBUILD_BUILD_HOST=Linux
TC_DIR="/workspace/vps/proton-clang"
export PATH="$TC_DIR/bin:$PATH"

mkdir -p out
make O=out ARCH=arm64 $DEFCONFIG


make -j$(nproc --all) O=out ARCH=arm64 CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- 2>&1 | tee log.txt

    echo -e "\033[93m==========================="
    echo -e "\033[93m=   COMPILE KERNEL COMPLETE ="
    echo -e "\033[93m==========================="
