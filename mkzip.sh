#!/bin/sh
BUILDDATE=`date +%Y%m%d-%H%M`
ZIP=kdk-vega-$BUILDDATE.zip
cp drivers/*/*.ko ./
cp drivers/*/*/*.ko ./
ls ./*.ko > modules.list

~/linaro-arm-eabi-4.9/bin/arm-eabi-strip -g `cat modules.list`

zip $ZIP zImage dt.img `cat modules.list`

gdrive upload $ZIP


