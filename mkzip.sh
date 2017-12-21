#!/bin/sh
BUILDDATE=`date +%Y%m%d-%H%M`
ZIP=kdk-vega-$BUILDDATE.zip

cp -f ./dt.img ./zip
cp -f ./zImage ./zip

cp -f drivers/*/*.ko ./zip/system/lib/modules
cp -f drivers/*/*/*.ko ./zip/system/lib/modules

#ls ./*.ko > modules.list
#~/linaro-arm-eabi-4.9/bin/arm-eabi-strip -g `cat modules.list`



cd ./zip ; zip -r ../$ZIP . * ; cd ..

gdrive upload $ZIP

rm -f ./zip/dt.img
rm -f ./zip/zImage
rm -f ./zip/system/lib/modules/*



