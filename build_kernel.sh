#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################

##############################################################################
# set toolchain
##############################################################################

export ARCH=arm
export PATH=/home/kaotd/arm-eabi-4.7/bin:$PATH
export CROSS_COMPILE=arm-eabi-

##############################################################################
# make zImage
##############################################################################
# mkdir -p ./obj/KERNEL_OBJ/
# make ARCH=arm O=./obj/KERNEL_OBJ/ cyanogenmod_ef63_defconfig
# make -j8 ARCH=arm O=./obj/KERNEL_OBJ/ 2>&1 | tee kernel_log.txt
# defconfig support: kd_ef60_defconfig , kd_ef63_defconfig
make CONFIG_NO_ERROR_ON_MISMATCH=y

##############################################################################
# Make dt.img & copy zImage
##############################################################################
./mkdt.sh

