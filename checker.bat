@echo off
title "Inimu Serial Checker (by noxx)"
color 70
echo.
:start
color 08
cls

echo.
echo    "_       _                 "
echo   "(_)     (_)                "
echo    " _ _ __  _ _ __ ___  _   _  "
echo   " | | '_ \| | '_ ` _ \| | | |"
echo   " | | | | | | | | | | |_| |"
echo   " |_|_| |_|_|_| |_| |_|\__,_|"
echo.                           
echo.  

echo  ============================
echo.        [Disk Drive:]
echo  ============================
echo.
wmic diskdrive get serialnumber
echo.
vol C: | findstr /R "Volume Serial Number"
vol D: | findstr /R "Volume Serial Number"
echo. 

echo  ============================
echo.      [Motherboard:]
echo  ============================
echo.
wmic baseboard get serialnumber
echo. 

echo  ============================
echo        [SMBios:]
echo  ============================
echo.
wmic path win32_computersystemproduct get uuid
echo. 

echo  ============================
echo.       ‎  [GPU:]
echo  ============================
echo.
wmic path Win32_VideoController GET Description
wmic path Win32_VideoController GET PNPDeviceID
nvidia-smi -L
echo.

echo  ============================
echo.         [RAM:]
echo  ============================
echo.
wmic memorychip get serialnumber
echo.

echo  ============================
echo.         [Bios:]
echo  ============================
echo.
wmic bios get serialnumber
echo.

echo  ============================
echo.         [CPU:]
echo  ============================
echo.
wmic cpu get processorid
wmic cpu get serialnumber
echo.

echo Press any key to get your hardware serials again.
pause >nul
goto start