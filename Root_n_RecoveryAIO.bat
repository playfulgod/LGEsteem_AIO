@ECHO OFF
color 3
:CHECKMODEL
CLS
:CHECKSWVERSION
CLS
:MENU
CLS
echo.
echo ======================================================================
echo =========One Click Root And Recovery Tool For The LG Esteem===========
echo ===========================By: mtmichaelson===========================
echo.
echo                 Make sure that USB Debugging is enabled,
Echo                 all drivers are installed, and that usb
Echo               Internet Connection is selected in usb mode
Echo.
ECHO ==============================Disclaimer==============================
Echo  I am not responsible for anything that may or may not happen to your
ECHO  phone. By selecting any choice you are accepting your own fate!!!!!!
ECHO ======================================================================
ECHO.
ECHO 1: Root
ECHO 2: Root and CWM Recovery
ECHO 3: Root and RZ Recovery
ECHO 4: Un-Root
ECHO 5: Stock Recovery
ECHO 6: Un-Root and Stock Recovery
ECHO 7: Reboot Recovery
Echo X: Exit
ECHO.
SET /P M=Make a selection then press ENTER: 
IF %M%==1 GOTO ROOT
IF %M%==2 GOTO CWMRECOVERY
IF %M%==3 GOTO RZRECOVERY
IF %M%==4 GOTO UNROOT
IF %M%==5 GOTO STOCK
IF %M%==6 GOTO UNROOTSTOCK
IF %M%==7 GOTO REBOOT
IF %M%==X GOTO BYE
IF %M%==x GOTO BYE



:ROOT
CLS
echo Rooting the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo.
echo.
echo.
Echo Rooting
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
Files\adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
Files\adb push Files\su /system/tmp/su
Files\adb push Files\busybox /system/tmp/busybox
Files\adb push Files\Superuser.apk /system/tmp/Superuser.apk
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo Removing Trash
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

Files\adb reboot

echo Finished Rooting!!!
pause
GOTO MENU



:CWMRECOVERY
CLS
echo Rooting the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo CWM Built by PlayfulGod and mtmichaelson
echo.
echo.
Echo Root and CWM
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb push Files\cwmrecovery.img /data/local/tmp/cwmrecovery.img
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
Files\adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
Files\adb push Files\su /system/tmp/su
Files\adb push Files\busybox /system/tmp/busybox
Files\adb push Files\Superuser.apk /system/tmp/Superuser.apk
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo Removing Trash
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"

echo Installing CWM Recovery

Files\adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
Files\adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/cwmrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

echo Finished Rooting!!!
Files\adb reboot

pause
GOTO MENU



:RZRECOVERY
CLS
echo Rooting the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo RZR Recovery built by PlayfulGod
echo.
echo.
Echo Root and RZR
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb push Files\rzrecovery.img /data/local/tmp/rzrecovery.img
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and Installing Root Files
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/tmp/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/etc/install-recovery.sh"
Files\adb shell /data/local/tmp/sh -c "rm /system/recovery-from-boot.p"
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "mkdir /system/tmp"
Files\adb shell /data/local/tmp/sh -c "chmod 777 /system/tmp"
Files\adb push Files\su /system/tmp/su
Files\adb push Files\busybox /system/tmp/busybox
Files\adb push Files\Superuser.apk /system/tmp/Superuser.apk
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/su /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/Superuser.apk /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "mv /system/tmp/busybox /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "chown root /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 4755 /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "ln -s /system/xbin/su /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "chmod 755 /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "/system/xbin/busybox --install /system/xbin/"

echo Removing Trash
Files\adb shell /data/local/tmp/sh -c "rmdir /system/tmp"

echo Installing RZ Recovery
Files\adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
Files\adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/rzrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

echo Finished Rooting!!!
Files\adb reboot

pause
GOTO MENU



:UNROOT
CLS
echo UnRooting the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo.
echo.
echo.
Echo UnRooting
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/busybox"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

Files\adb reboot

echo Finished UnRooting!!!
pause
GOTO MENU



:STOCK
CLS
echo Stock Recovery for the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo.
echo.
echo.
Echo Stock Recovery
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb push Files\stockrecovery.img /data/local/tmp/stockrecovery.img
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"

echo Installing Stock Recovery
Files\adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
Files\adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
Files\adb reboot

echo Stock Recovery!!!
pause
GOTO MENU



:UNROOTSTOCK
CLS
echo UnRooting the LG Esteem
echo Tool Built by mtmichaelson
echo Exploit Built by the Revolutionary Team
echo.
echo.
echo.
Echo UnRooting
pause
Files\adb kill-server
Files\adb wait-for-device

echo Device found

echo Pushing Zergrush
Files\adb push Files\zergrush /data/local/tmp/zergrush
Files\adb push Files\stockrecovery.img /data/local/tmp/stockrecovery.img
Files\adb shell "chmod 755 /data/local/tmp/zergrush"

echo Running Zergrush
Files\adb shell "echo exit | /data/local/tmp/zergrush"

echo Removing Trash and UnRooting
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/system /system"
Files\adb shell /data/local/tmp/sh -c "mount -orw,remount /dev/block/data /data"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/su"
Files\adb shell /data/local/tmp/sh -c "rm /system/app/Superuser.apk"
Files\adb shell /data/local/tmp/sh -c "rm /system/xbin/busybox"
Files\adb shell /data/local/tmp/sh -c "rm /system/bin/busybox"

echo Installing Stock Recovery
Files\adb shell /data/local/tmp/sh -c "dd if=/dev/block/mmcblk0p14 of=/sdcard/mmcblk0p14.backup bs=4096"
Files\adb shell /data/local/tmp/sh -c "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"
Files\adb reboot

echo Finished UnRooting!!!
pause
GOTO MENU



:REBOOT
CLS
echo Rebooting Recovery
echo Tool Built by mtmichaelson
echo.
echo.
echo.
echo.
Echo Recovery
pause
Files\adb kill-server
Files\adb wait-for-device
Files\adb reboot recovery

echo Recovery!!!
pause
GOTO MENU

:CHECKMODEL
echo Checking Current Phone Build...
FOR /F "tokens=*" %%i in ('adb shell getprop ro.product.device') do SET model=%%i
echo.
echo Phone Model is Detected as %model%
echo.
IF "%model%"=="MS910" (
	set sdir=VS910
	goto :eof
)
IF "%model%"=="VS910" (
	set sdir=VS910
	goto :eof
)
echo.
echo THIS SCRIPT IS FOR LG ESTEEM and REVOLUTION
echo MODELS MS910 AND VS910 ONLY
echo SCRIPT WILL NOW ABORT
adb kill-server
pause
exit

:CHECKSWVERSION
echo Checking Software Version...
FOR /F "tokens=*" %%i in (adb shell getprop ro.build.version.incremental') do SET swver=%%i
echo.
echo Software Version is Detected as %swver%
echo.
IF "%swver% == "ZVC.421C2767" 
echo THIS ONLY WORKS WITH ZVB
echo.
echo THIS WILL NOT WORK WITH ZVC
echo.
echo SCRIPT WILL NOW ABORT!
adb kill-server
pause
exit

:BYE
cls
echo One Click Root and Recovery Tool
echo ========By: mtmichaelson========
echo.
echo.
echo.
echo.
echo Hope you enjoyed! If you would like to 
echo donate, follow the link in my signature!
echo Thanks for playing!!!
pause >NUL
exit
