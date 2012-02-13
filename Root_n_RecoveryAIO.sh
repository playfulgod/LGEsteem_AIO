#!/bin/bash
#################################################
### Based off the AIO Indulge by DRockstar    
#################################################

dev="PlayfulGod"
cwmver="5.0.2.8"
rzver="2.1.4-esteem"
phone="LG Esteem MS910"
title="All in One Root and Recovery for the $phone" 
menu1="Root Phone"
menu2="Root and Install Clockworkmod Recovery $cwmver"
menu3="Root and Install RZ Recovery $rzver"
menu4="Unroot Phone"
menu5="Install stock recovery"
menu6="Unroot and install stock recovery"
menu7="Reboot Phone"
menu8="Reboot to Recovery"
menu9="Exit"

# Unix OS Sniffer and $adb setup by Firon
platform=`uname`;
adb="adb";
if [ $(uname -p) == 'powerpc' ]; then
	echo "Sorry, this won't work on PowerPC machines."
exit 1
fi
cd "$(dirname "$0")"
if [ -z $(which adb) ]; then
	adb="./adb";
	if [ "$platform" == 'Darwin' ]; then
		mv adb.osx $adb > /dev/null 2>&1
	fi
fi
chmod +x $adb
# End section, thanks Firon!

function menu {
clear
MENU_CHOICE=""
header "$title" 
echo
echo ============================== $dev ===========================
echo
echo                 Make sure that USB Debugging is enabled,
echo                 all drivers are installed, and that usb
echo               Internet Connection is selected in usb mode
echo
echo ============================== Disclaimer ============================
echo
echo  I am not responsible for anything that may or may not happen to your
echo  phone. By selecting any choice you are accepting your own fate!!!!!!
echo ======================================================================
echo
echo ============================== Other credits =========================
echo
echo  mtmichealson, DRockstar, koush, Raidzero, thecubed, and firon.
echo ======================================================================
echo
echo "MENU:";
echo
echo " 1) $menu1";
echo " 2) $menu2";
echo " 3) $menu3";
echo " 4) $menu4";
echo " 5) $menu5";
echo " 6) $menu6";
echo " 7) $menu7";
echo " 8) $menu8";
echo " 9) $menu9";

echo
echo ONLY ONE MENU ITEM IS RUN AT A TIME
echo
read -n1 -s -p "Please Type a Number [1-9]: " MENU_CHOICE
echo
echo
case $MENU_CHOICE in
"1") header "Rooting Phone";root;;
"2") header "Installing Clockworkmod Recovery $cwmver";cwmrecovery;;
"3") header "Installing Raidzero Recovery $rzrver";rzrecovery;;
"4") header "Unrooting Phone";unroot;;
"5") header "Installing Stock Recovery";stock;;
"6") header "Unrooting and Installing Stock Recovery";unrootstock;;
"7") header "Rebooting Phone";REBOOT;end;;
"8") header "Rebooting into Recovery";REBOOT recovery;end;;
"9") bye;;
*) menu;;
esac
}



function root {
header "$menu1" 
clear
echo Rooting the $phone
echo 
echo Exploit Built by the Revolutionary Team
echo

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
$adb shell /data/local/tmp/sh -c "rm /system/bin/su"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
$adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
$adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
$adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
$adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
$adb push Files/su /system/tmp/su
$adb push Files/busybox /system/tmp/busybox
$adb push Files/Superuser.apk /system/tmp/Superuser.apk
$adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
$adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
$adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
$adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo Removing Trash
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
$adb shell "rm /data/local/tmp/* 2>/dev/null"

$adb reboot

echo Finished Rooting!!!

end
}



function cwmrecovery {
header "$menu2" 
echo
echo Root and CWM

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb push Files/cwmrecovery.img /data/local/tmp/cwmrecovery.img
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
echo 
echo If there are any rm errors it just means there was nothing to rm.
echo
echo
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
$adb shell /data/local/tmp/sh -c "rm /system/bin/su"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
$adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
$adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
$adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
$adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
$adb push Files/su /system/tmp/su
$adb push Files/busybox /system/tmp/busybox
$adb push Files/Superuser.apk /system/tmp/Superuser.apk
$adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
$adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
$adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
$adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo
echo Removing Trash
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"

echo
echo Installing CWM Recovery
echo

$adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
$adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/cwmrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
$adb shell "rm /data/local/tmp/* 2>/dev/null"

echo Finished Rooting!!!
$adb reboot

end
}


function rzrecovery {
header "$menu3" 
echo
echo Root and RZR

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb push Files/rzrecovery.img /data/local/tmp/rzrecovery.img
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
echo 
echo If there are any rm errors it just means there was nothing to rm.
echo
echo
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
$adb shell /data/local/tmp/sh -c "rm /system/bin/su"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
$adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
$adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
$adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
$adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
$adb push Files/su /system/tmp/su
$adb push Files/busybox /system/tmp/busybox
$adb push Files/Superuser.apk /system/tmp/Superuser.apk
$adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
$adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
$adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
$adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo
echo Removing Trash
$adb shell /data/local/tmp/sh -c "rmdir /system/tmp"

echo
echo Installing CWM Recovery $cwmver
echo

$adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
$adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/rzrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
$adb shell "rm /data/local/tmp/* 2>/dev/null"

echo Finished Rooting!!!
$adb reboot

end
}




function unroot {
header "$menu4" 
echo UnRooting the $phone
echo Tool Built by $dev
echo Exploit Built by the Revolutionary Team
echo
echo
echo
echo UnRooting

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
$adb shell /data/local/tmp/sh -c "rm /system/bin/su"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
$adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/bin/busybox"
$adb shell "rm /data/local/tmp/* 2>/dev/null"

$adb reboot

echo Finished UnRooting!!!

end
}


function stock {
header "$menu5" 
echo Stock Recovery for the $phone
echo Tool Built by $dev
echo Exploit Built by the Revolutionary Team
echo
echo
echo
echo Stock Recovery

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb push Files/stockrecovery.img /data/local/tmp/stockrecovery.img
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"

echo Installing Stock Recovery
$adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
$adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
$adb reboot

echo Stock Recovery!!!

end
}



function unrootstock {
header "$menu6" 
echo UnRooting the $phone
echo Tool Built by $dev
echo Exploit Built by the Revolutionary Team
echo
echo
echo
echo UnRooting

$adb kill-server
$adb wait-for-device

echo Device found

echo Pushing Zergrush
$adb push Files/zergrush /data/local/tmp/zergrush
$adb push Files/stockrecovery.img /data/local/tmp/stockrecovery.img
$adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
$adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
$adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
$adb shell /data/local/tmp/sh -c "rm /system/bin/su"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
$adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
$adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
$adb shell /data/local/tmp/sh -c "rm /system/bin/busybox"

echo Installing Stock Recovery
$adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
$adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
$adb shell "rm /data/local/tmp/* 2>/dev/null"
$adb reboot

echo Finished UnRooting!!!

end
}


function bye {
header "$menu9" 
echo One Click Root and Recovery Tool
echo ========By: mtmichaelson ========
echo
echo ____-Shell Script by PlayfulGod-_____
echo
echo Based off the Indulge AIO by DRockstar
echo
echo
echo Hope you enjoyed! If you would like to 
echo donate, follow the link in our signatures!
echo Thanks for playing!!!
echo
echo

exit
}

function main {
chooser
startserver
checkmodel
}

function header {
clear
echo ===============================================================================
echo $1
echo ===============================================================================
echo $2
echo
}

function chooser {
echo
read -n1 -s -p "Press any key to continue, or M for Main Menu :" CHOOSE
case $CHOOSE in
[mM]) echo; menu;;
esac
echo
}

function REBOOT {
if [ "$1" == "recovery" ]; then
	echo Rebooting into Recovery...
else
	echo Rebooting Phone...
fi
$adb start-server
$adb reboot $1
}

function end {
killserver
echo
echo All Done!
echo
read -n1 -s -p "Press any key to exit, or M for Main Menu :" CHOOSE
case $CHOOSE in
[mM]) echo; menu;;
esac
echo; echo
exit
}

function killserver {
if [ -z $(which sudo 2>/dev/null) ]; then
	$adb kill-server
else
	sudo $adb kill-server
fi
}

function connect {
# Based on timer script contribution from Firon
echo Looking for device
state="unknown"
state=$($adb get-state | tr -d '\r\n[:blank:]')
i=0
while [[ "$state" != device && $i -lt 30 ]]; do
	state=$($adb get-state | tr -d '\r\n[:blank:]')
	let i=i+1
	sleep 1
done
if [ "$state" != "device" ]; then
      echo
      echo The device cannot be found.
      read -n1 -s -p "Plug or replug the USB cable. Press any key to continue. "
      echo
      sleep 5
      let i=i+5
fi
state=$($adb get-state | tr -d '\r\n[:blank:]')
if [ "$state" != "device" ]; then
	echo
	echo ABORTING SCRIPT. PHONE IS STILL NOT CONNECTED.
	echo MANUALLY REBOOT THE PHONE.
	echo IF ADB OR SCRIPT ERRORS ARE OCCURING,
	echo VISIT FORUM FOR ADDITIONAL GUIDANCE.
	end
fi
echo Device found in $i seconds
echo
}


case $1 in
"-e") startserver;checkroot;exit;;
"-k") killserver;exit;;
"-r") startserver;REBOOT;exit;;
"-s") startserver;exit;;
esac

menu