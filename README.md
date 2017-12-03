# KD Kernel for VEGA IM-A880/A890/A900/A910

A custom kernel developed by KaoTD, supported for VEGA IM-A880/A890/A900/A910

### Building

Open terminal, and you know what to do now, get some f**king things:
```
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev gcc-multilib maven tmux screen w3m ncftp
```


Cloning kernel source:
```
git clone http://github.com/KaoTD/kd_kernel_msm8974
```


Enter the directory:
```
cd kd_kernel_msm8974
```


Export toolchain:
```
export ARCH=arm
export CROSS_COMPILE=./arm-eabi-4.*/bin/arm-eabi-
```
NOTE: "*" : 7 or 8, default 8. If you want LEDs work, use gcc-4.7 and make sure to revert this commit "bf1bb0377e352e8b5db32458a159cd38ca4ee94e". By compiling using gcc-4.7, this will decrease the kernel performance.
By using gcc-4.8, LEDs driver will not working because incompatible driver. And with this, you got better performance and smoothly work.


Make defconfig:
```
make xx_defconfig
```
xx : is your device codename(Supported: ef56, ef59, ef60, ef63)

By default, these defconfig will compile kernel compatible for Nougat, for Marshmallow, use this:
```
make xx_mm_defconfig
```
xx : is your device codename(Supported: ef56, ef59, ef60. ef63 kernel compatible with both mm & ng without building mm_defconfig)


Now is the main part:
```
make -jX CONFIG_NO_ERROR_ON_MISMATCH=y
```
X : is the number of your cpu cores


The final part when the building is complete:
```
./mkdt.sh
```

After running bellow command, you will see "zImage" and "dt.img" that is kernel and dtb.

One more command to get your modules:
```
cp ./drivers/scsi/scsi_wait_scan.ko ./arm-eabi-4.*/bin
cp ./drivers/staging/prima/wlan.ko ./arm-eabi-4.*/bin
cd ./arm-eabi-4.*/bin
./arm-eabi-strip -g scsi_wait_scan.ko
./arm-eabi-strip -g wlan.ko
cp -f scsi_wait_scan.ko ../../
cp -f wlan.ko ../../
```
NOTE: "*" : depends on your choice above

Now you got: 'zImage', 'dt.img', 'scsi_wait_scan.ko', 'wlan.ko'(if you compiled with mm_defconfig)

### Installing

Download this template zip: * [kdk-vega.zip](https://github.com/KaoTD/kd_kernel_msm8974/blob/master/kdk-vega.zip?raw=true)

Put zImage & dt.img in root of the zip, put scsi_wait_scan.ko & wlan.ko in system/lib/modules folder of the zip.

Then flash using custom recovery ! Goodluck !

### Credit

Thanks to all my friend, testers, and special:

* [Chau Truong Thinh](http://github.com/chautruongthinh)
* [Nguyen Ly Hoa](http://github.com/hoalamha)
* [Nguyen Sang](http://github.com/renosang)
* [DroidVN Team](http://droidvn.com)
* [Myself](http://fb.com/kaotd)


