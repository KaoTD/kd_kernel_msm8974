#!/sbin/sh
echo "get boot for edit..."
dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=/cache/boot.img
echo "unpacking boot image"
cd /cache
./u boot.img

echo "changing zImage - dtb"
mv /cache/dt.img /cache/split_img/boot.img-dtb
mv /cache/zImage /cache/split_img/boot.img-zImage

echo "repacking img"
./r
echo "flashing new image"
dd if=image-new.img of=/dev/block/platform/msm_sdcc.1/by-name/boot
echo "Flash done !!"
rm -rf /cache/*
echo "All DONE !"
