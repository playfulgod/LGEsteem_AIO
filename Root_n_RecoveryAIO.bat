@ECHO OFF
color 3
set cred=@djrbliss, DRockstar, koush, Raidzero, thecubed, and firon
set dev=PlayfulGod and mtmichaelson
set phone=LG Esteem & Revolution
set cwmver=5.5.0.4
set rzver=2.1.4-esteem
:CHECKMODEL
CLS
:MENU
CLS
echo ======================================================================
echo All-in-One Root And Recovery Tool For The LG Esteem and Revolution
echo ====================By: %dev% ==================
echo.
echo                 Make sure that USB Debugging is enabled,
Echo                 all drivers are installed, and that usb
Echo               Internet Connection is selected in usb mode
ECHO ==============================Disclaimer==============================
Echo  I am not responsible for anything that may or may not happen to your
ECHO  phone. By selecting any choice you are accepting your own fate!!!!!!
ECHO ======================================================================
echo =============================Other credits============================
echo   %cred%.
echo ======================================================================
ECHO.
ECHO 1: Root
ECHO 2: Root and CWM Recovery %cwmver%
ECHO 3: Root and RZ Recovery %rzver% (ESTEEM ONLY!!!!)
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
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]
echo [*] Re-roots the patched LG Esteem
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled, that you
echo [*] have the latest LG drivers installed, and that your phone is
echo [*] connected via USB.
echo [*]
echo [*] Press enter to root your phone...
pause
echo [*] 

echo [*] Waiting for device...
Files\adb kill-server
Files\adb wait-for-device

echo [*] Device found.

Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

:: Install the goods
echo [*] Installing root tools... 
Files\adb remount
Files\adb push Files\su /system/bin/su
Files\adb shell "chmod 6755 /system/bin/su"
Files\adb shell "ln -s /system/bin/su /system/xbin/su"
Files\adb push Files\Superuser.apk /system/app/Superuser.apk
Files\adb push Files\busybox /system/xbin/busybox
Files\adb shell "chmod 755 /system/xbin/busybox"
Files\adb shell "/system/xbin/busybox --install /system/xbin"

:: Clean up after ourselves
echo [*] Cleaning up...
Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Root complete, enjoy!

echo Finished Rooting!!!
pause
GOTO MENU



:CWMRECOVERY
CLS
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]
echo [*] Re-roots the patched LG Esteem & installs CWM 
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled, that you
echo [*] have the latest LG drivers installed, and that your phone is
echo [*] connected via USB.
echo [*]
echo [*] Press enter to root your phone...
pause
echo [*] 

echo [*] Waiting for device...
Files\adb kill-server
Files\adb wait-for-device

echo [*] Device found.

Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

:: Install the goods
echo [*] Installing root tools... 
Files\adb remount
Files\adb push Files\su /system/bin/su
Files\adb shell "chmod 6755 /system/bin/su"
Files\adb shell "ln -s /system/bin/su /system/xbin/su"
Files\adb push Files\Superuser.apk /system/app/Superuser.apk
Files\adb push Files\busybox /system/xbin/busybox
Files\adb shell "chmod 755 /system/xbin/busybox"
Files\adb shell "/system/xbin/busybox --install /system/xbin"

echo.
echo [*] Pushing CWM to Phone
echo.
Files\$adb push Files\$sdir\cwmrecovery.img /data/local/tmp/cwmrecovery.img
echo.
echo [*] Installing CWM Recovery
echo.
Files\adb shell "dd if=/data/local/tmp/cwmrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

echo [*] Root complete!!!
echo.
echo [*] Finished Installing Clockworkmod Recovery!!!
echo.
Files\adb reboot

:: Clean up after ourselves
echo [*] Cleaning up...
Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Finished, enjoy!

pause
GOTO MENU



:RZRECOVERY
CLS
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]
echo [*] Re-roots the patched LG Esteem & installs RZR 
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled, that you
echo [*] have the latest LG drivers installed, and that your phone is
echo [*] connected via USB.
echo [*]
echo [*] Press enter to root your phone...
pause
echo [*] 

echo [*] Waiting for device...
adb kill-server
adb wait-for-device

echo [*] Device found.

Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

:: Install the goods
echo [*] Installing root tools... 
Files\adb remount
Files\adb push Files\su /system/bin/su
Files\adb shell "chmod 6755 /system/bin/su"
Files\adb shell "ln -s /system/bin/su /system/xbin/su"
Files\adb push Files\Superuser.apk /system/app/Superuser.apk
Files\adb push Files\busybox /system/xbin/busybox
Files\adb shell "chmod 755 /system/xbin/busybox"
Files\adb shell "/system/xbin/busybox --install /system/xbin"

echo.
echo [*] Pushing RZR to Phone
echo.
Files\adb push Files\$sdir\rzrecovery.img /data/local/tmp/rzrecovery.img
echo.
echo [*] Installing RZ Recovery
echo.
Files\adb shell "dd if=/data/local/tmp/rxrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

echo [*] Root complete!!!
echo.
echo [*] Finished Installing RZ Recovery!!!
echo.
Files\adb reboot

:: Clean up after ourselves
echo [*] Cleaning up...adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Finished, enjoy!

pause
GOTO MENU



:UNROOT
CLS
echo [*] UnRooting the $phone
echo [*]Tool Built by %dev%
echo.
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]


echo [*] Waiting for device...
Files\adb kill-server
Files\adb wait-for-device

echo [*] Device found.

$adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

# Remove Root Tools
echo [*] UnRooting
Files\adb remount
Files\adb shell "rm /system/bin/su"
Files\adb shell "rm /system/xbin/su"
Files\adb shell "rm /system/app/Superuser.apk"
Files\adb shell "rm /system/xbin/busybox"
Files\adb shell "rm /system/bin/busybox"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo [*] Cleaning up...
Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Unroot complete, enjoy!

Files\adb kill-server

echo [*] Device found

echo [*] Finished UnRooting!!!
pause
GOTO MENU



:STOCK
CLS
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]
echo [*] RZR %rzrver% built by PlayfulGod
echo [*] RZR Install by PlayfulGod"
echo [*] Copyright (c) 2012 PlayfulGod"
echo [*]"
echo [*] Root the LG Esteem, ZVB or ZVC and Installs RZR %rzrver%
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled and that your
echo [*] phone is connected via USB.
echo [*]
echo [*] Press enter to root your phone...
pause
echo [*] 

echo [*] Waiting for device...
Files\adb kill-server
Files\adb wait-for-device

echo [*] Device found.

Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

# Install the goods
echo [*] Installing root tools... 
Files\adb remount
Files\adb push Files\su /system/bin/su
Files\adb shell "chmod 6755 /system/bin/su"
Files\adb shell "ln -s /system/bin/su /system/xbin/su"
Files\adb push Files\Superuser.apk /system/app/Superuser.apk
Files\adb push Files\busybox /system/xbin/busybox
Files\adb shell "chmod 755 /system/xbin/busybox"
Files\adb shell "/system/xbin/busybox --install /system/xbin"

echo.
echo [*] Pushing Stock Recovery to Phone
echo.
Files\adb push Files\$sdir\stockrecovery.img /data/local/tmp/stockrecovery.img
echo.
echo [*] Installing Stock Recovery
echo.
Files\adb shell "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo [*] Cleaning up...
Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Root complete!!!
echo.
echo [*] Finished Installing Stock Recovery!!!
echo.
echo [*] Enjoy!
Files\adb reboot
pause
GOTO MENU



:UNROOTSTOCK
CLS
echo [*] UnRooting the %phone%
echo [*]Tool Built by %dev%
echo.
echo [*] LG Esteem root script v2 (Windows version)
echo [*] Copyright (c) 2012 Dan Rosenberg (@djrbliss)
echo [*]


echo [*] Waiting for device...
Files\adb kill-server
Files\adb wait-for-device

echo [*] Device found.

Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "ln -s /data /data/bootlogo/bootlogopid"

echo [*] Rebooting...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

Files\adb shell "echo 'ro.kernel.qemu=1' > /data/local.prop"

echo [*] Rebooting again...
Files\adb reboot
echo [*] Waiting for reboot...
Files\adb wait-for-device

# Remove Root Tools
echo [*] UnRooting
Files\adb remount
Files\adb shell "rm /system/bin/su"
Files\adb shell "rm /system/xbin/su"
Files\adb shell "rm /system/app/Superuser.apk"
Files\adb shell "rm /system/xbin/busybox"
Files\adb shell "rm /system/bin/busybox"
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

echo.
echo [*] Pushing Stock Recovery to Phone
echo.
Files\adb push Files\$sdir\stockrecovery.img /data/local/tmp/stockrecovery.img
echo.
echo [*] Installing Stock Recovery
echo.
Files\adb shell "dd if=/data/local/tmp/stockrecovery.img of=/dev/block/mmcblk0p14 bs=4096" 
Files\adb shell "rm /data/local/tmp/* 2>/dev/null"

# Clean up after ourselves
echo [*] Cleaning up...
Files\adb shell "rm /data/bootlogo/bootlogopid"
Files\adb shell "rm /data/local.prop"

echo [*] Rebooting one last time...
Files\adb reboot

Files\adb wait-for-device
echo [*] Unroot complete, enjoy!

Files\adb kill-server

echo [*] Device found

echo [*] Finished UnRooting!!!
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
	set sdir=MS910
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
Files\adb kill-server
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
