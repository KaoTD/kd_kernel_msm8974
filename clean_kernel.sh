#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################

export ARCH=arm
export CROSS_COMPILE=./arm-eabi-4.7/bin/arm-eabi-


make mrproper
rm -rf ./kernel_log.txt
rm -rf ./obj
rm -rf ./zImage
rm -rf ./dt.img
