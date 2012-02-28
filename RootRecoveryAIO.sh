#!/bin/bash
#################################################
### Based off the AIO Indulge by DRockstar    
#################################################
ver="v1.2"
dev="PlayfulGod and mtmichaelson"
cred="@djrbliss, DRockstar, koush, Raidzero, thecubed, and firon"
cwmver="5.5.0.4"
rzver="2.1.4-esteem"
phone="LG Esteem and Revolution"
title="All in One Root and Recovery $ver for the $phone" 
menu1="Root Phone"
menu2="Root and Install Clockworkmod Recovery $cwmver"
menu3="Root and Install RZ Recovery $rzver (Esteem ONLY!!)"
menu4="Unroot Phone"
menu5="Install stock recovery"
menu6="Unroot and install stock recovery"
menu7="Reboot Phone"
menu8="Reboot to Recovery"
menu9="Exit"

# Unix OS Sniffer and Files/$adb setup by Firon
platform=`uname`
if [ $(uname -p) = 'powerpc' ]; then
        echo "[-] PowerPC is not supported."
        exit 1
fi

if [ "$platform" = 'Darwin' ]; then
        adb="Files/./adb.osx"
        version="OSX"
else
        adb="Files/./adb"
        version="Linux"
fi
chmod +x adb

which adb > /dev/null 2>&1
if [ $? -eq 0 ]; then
        adb="Files/adb"
fi
# End section, thanks Firon!

function menu {
clear
startserver
clear
checkmodel
clear
MENU_CHOICE=""
echo "================================================================================"
echo "  $title by             "
echo "========================= $dev =========================="
echo "Make sure that USB Debugging is enabled, all drivers are installed, and that usb"
echo "                  Internet Connection is selected in usb mode                   "
echo "================================= Disclaimer ==================================="
echo " I am not responsible for anything that may or may not happen to your phone. By "
echo "           selecting any choice you are accepting your own fate!!!!!!           "
echo "================================ Other credits ================================="
echo "                $cred.                "
echo "================================================================================"
echo
echo "MENU:";
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
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"
echo "[*] Re-roots the patched LG Esteem"
echo "[*]"
echo "[*] Before continuing, ensure USB debugging is enabled and that your"
echo "[*] phone is connected via USB."
echo "[*]"
echo "[*] Press enter to root your phone..."

read -n 1 -s

echo "[*]"

echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Install the goods
echo "[*] Installing root tools... "
Files/$adb remount
Files/$adb push su /system/bin/su
Files/$adb shell "chmod 6755 /system/bin/su"
Files/$adb shell "ln -s /system/bin/su /system/xbin/su"
Files/$adb push Files/Superuser.apk /system/app/Superuser.apk
Files/$adb push Files/busybox /system/xbin/busybox
Files/$adb shell "chmod 755 /system/xbin/busybox"
Files/$adb shell "/system/xbin/busybox --install /system/xbin"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Root complete, enjoy!"

Files/$adb kill-server

echo Finished Rooting!!!

end
}



function cwmrecovery {
header "$menu2" 
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"
echo "[*] CWM $cwmver built by $dev"
echo "[*] CWM Install by PlayfulGod"
echo "[*] Copyright (c) 2012 PlayfulGod"
echo "[*]"
echo "[*] Root the LG Esteem, ZVB or ZVC and Installs CWM $cwmver"
echo "[*]"
echo "[*] Before continuing, ensure USB debugging is enabled and that your"
echo "[*] phone is connected via USB."
echo "[*]"
echo "[*] Press enter to root your phone and install CWM..."

read -n 1 -s

echo "[*]"

echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Install the goods
echo "[*] Installing root tools... "
Files/$adb remount
Files/$adb push Files/su /system/bin/su
Files/$adb shell "chmod 6755 /system/bin/su"
Files/$adb shell "ln -s /system/bin/su /system/xbin/su"
Files/$adb push Files/Superuser.apk /system/app/Superuser.apk
Files/$adb push Files/busybox /system/xbin/busybox
Files/$adb shell "chmod 755 /system/xbin/busybox"
Files/$adb shell "/system/xbin/busybox --install /system/xbin"

echo
echo "[*] Pushing CWM to Phone"
echo
Files/$adb push Files/$sdir/cwmrecovery.img /data/local/tmp/cwmrecovery.img
echo
echo "[*] Installing CWM Recovery"
echo
Files/$adb shell "dd if=/data/local/tmp/cwmrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Root complete!!!"
echo
echo "[*] Finished Installing Clockworkmod Recovery!!!"
echo
echo "[*] Enjoy!"
Files/$adb reboot

end
}


function rzrecovery {
header "$menu3" 
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"
echo "[*] RZR $rzrver built by PlayfulGod"
echo "[*] RZR Install by PlayfulGod"
echo "[*] Copyright (c) 2012 PlayfulGod"
echo "[*]"
echo "[*] Root the LG Esteem, ZVB or ZVC and Installs RZR $rzrver"
echo "[*]"
echo "[*] Before continuing, ensure USB debugging is enabled and that your"
echo "[*] phone is connected via USB."
echo "[*]"
echo "[*] Press enter to root your phone and install CWM..."

read -n 1 -s

echo "[*]"

echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Install the goods
echo "[*] Installing root tools... "
Files/$adb remount
Files/$adb push Files/su /system/bin/su
Files/$adb shell "chmod 6755 /system/bin/su"
Files/$adb shell "ln -s /system/bin/su /system/xbin/su"
Files/$adb push Files/Superuser.apk /system/app/Superuser.apk
Files/$adb push Files/busybox /system/xbin/busybox
Files/$adb shell "chmod 755 /system/xbin/busybox"
Files/$adb shell "/system/xbin/busybox --install /system/xbin"

echo
echo "[*] Pushing RZR to Phone"
echo
Files/$adb push Files/$sdir/rzrecovery.img /data/local/tmp/rzrecovery.img
echo
echo "[*] Installing RZR Recovery"
echo
Files/$adb shell "dd if=/data/local/tmp/rzrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Root complete!!!"
echo
echo "[*] Finished Installing RZ Recovery!!!"
echo
echo "[*] Enjoy!"
Files/$adb reboot

end
}



function unroot {
header "$menu4" 
echo "[*] UnRooting the $phone"
echo "[*]Tool Built by $dev"
echo
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"


echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Remove Root Tools
echo "[*] UnRooting"
Files/$adb remount
Files/$adb shell "rm /system/bin/su"
Files/$adb shell "rm /system/xbin/su"
Files/$adb shell "rm /system/app/Superuser.apk"
Files/$adb shell "rm /system/xbin/busybox"
Files/$adb shell "rm /system/bin/busybox"
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Unroot complete, enjoy!"

Files/$adb kill-server

echo "[*] Device found"

echo "[*] Finished UnRooting!!!"

end
}


function stock {
header "$menu5" 
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"
echo "[*] RZR $rzrver built by PlayfulGod"
echo "[*] RZR Install by PlayfulGod"
echo "[*] Copyright (c) 2012 PlayfulGod"
echo "[*]"
echo "[*] Root the LG Esteem, ZVB or ZVC and Installs RZR $rzrver"
echo "[*]"
echo "[*] Before continuing, ensure USB debugging is enabled and that your"
echo "[*] phone is connected via USB."
echo "[*]"
echo "[*] Press enter to root your phone and install CWM..."

read -n 1 -s

echo "[*]"

echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Install the goods
echo "[*] Installing root tools... "
Files/$adb remount
Files/$adb push Files/su /system/bin/su
Files/$adb shell "chmod 6755 /system/bin/su"
Files/$adb shell "ln -s /system/bin/su /system/xbin/su"
Files/$adb push Files/Superuser.apk /system/app/Superuser.apk
Files/$adb push Files/busybox /system/xbin/busybox
Files/$adb shell "chmod 755 /system/xbin/busybox"
Files/$adb shell "/system/xbin/busybox --install /system/xbin"

echo
echo "[*] Pushing Stock Recovery to Phone"
echo
Files/$adb push Files/$sdir/stockrecovery.img /data/local/tmp/stockrecovery.img
echo
echo "[*] Installing Stock Recovery"
echo
Files/$adb shell "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Root complete!!!"
echo
echo "[*] Finished Installing Stock Recovery!!!"
echo
echo "[*] Enjoy!"
Files/$adb reboot

end
}

function unrootstock {
header "$menu6" 
echo "[*] UnRooting the $phone"
echo "[*]Tool Built by $dev"
echo
echo "[*] LG Esteem root script v2 ($version version)"
echo "[*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)"
echo "[*]"


echo "[*] Waiting for device..."
Files/$adb kill-server
Files/$adb wait-for-device

echo "[*] Device found."

Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo "[*] Rebooting..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

Files/$adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo "[*] Rebooting again..."
Files/$adb reboot
echo "[*] Waiting for reboot..."
Files/$adb wait-for-device

# Remove Root Tools
echo "[*] UnRooting"
Files/$adb remount
Files/$adb shell "rm /system/bin/su"
Files/$adb shell "rm /system/xbin/su"
Files/$adb shell "rm /system/app/Superuser.apk"
Files/$adb shell "rm /system/xbin/busybox"
Files/$adb shell "rm /system/bin/busybox"
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

echo
echo "[*] Pushing Stock Recovery to Phone"
echo
Files/$adb push Files/$sdir/stockrecovery.img /data/local/tmp/stockrecovery.img
echo
echo "[*] Installing Stock Recovery"
echo
Files/$adb shell "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files/$adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo "[*] Cleaning up..."
Files/$adb shell "rm /data/bootlogo/bootlogopid"
Files/$adb shell "rm /data/local.prop"

echo "[*] Rebooting one last time..."
Files/$adb reboot

Files/$adb wait-for-device
echo "[*] Unroot complete, enjoy!"

Files/$adb kill-server

echo "[*] Device found"

echo "[*] Finished UnRooting!!!"

end
}


function bye {
header "$menu9" 
killserver
echo ========By: $dev ========
echo
echo ================= Other Credits ================
echo $cred
echo ================================================
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
killserver
checkmodel
checkswversion
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
sudo Files/$adb start-server
Files/$adb reboot $1
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

function startserver {
killserver
if [ -z $(which sudo 2>/dev/null) ]; then
Files/$adb start-server
else
sudo Files/$adb start-server
fi
connect
}

function killserver {
if [ -z $(which sudo 2>/dev/null) ]; then
	sudo Files/$adb kill-server
else
	sudo sudo Files/$adb kill-server
fi
}

function connect {
# Based on timer script contribution from Firon
echo "Looking for device"
state="unknown"
state=$(Files/$adb get-state | tr -d '\r\n[:blank:]')
i=0
while [[ "$state" != device && $i -lt 30 ]]; do
	state=$(Files/$adb get-state | tr -d '\r\n[:blank:]')
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
state=$(Files/$adb get-state | tr -d '\r\n[:blank:]')
if [ "$state" != "device" ]; then
	echo
	echo ABORTING SCRIPT. PHONE IS STILL NOT CONNECTED.
	echo MANUALLY REBOOT THE PHONE.
	echo IF ADB OR SCRIPT ERRORS ARE OCCURING,
	echo "VISIT FORUM FOR ADDITIONAL GUIDANCE."
	end
fi
echo Device found in $i seconds
echo
}

function checkmodel {
echo Checking current phone model...
model=(Files/$adb shell getprop ro.product.device | tr -d '\r\n[:blank:]')
echo;echo Phone Model is Detected as $model;echo
if [ "$model" == "MS910" ]; then
	sdir="MS910"
elif [ "$model" == "VS910" ]; then
	sdir="VS910"
else
	echo
	echo THIS SCRIPT IS FOR THE LG ESTEEM and REVOLUTION
	echo MODELS MS910 and VS910 ONLY
	echo SCRIPT WILL NOW ABORT
	echo
	exit
fi
}

case $1 in
"-e") startserver;checkroot;exit;;
"-k") killserver;exit;;
"-r") startserver;REBOOT;exit;;
"-s") startserver;exit;;
esac

menu
