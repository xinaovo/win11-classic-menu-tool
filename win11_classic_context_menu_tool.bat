@echo off
echo.Trying to get administrator privilege...
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
color 3f
goto MENU

:MENU
cls
echo.============================================
echo.   Windows 11 Classic Context Menu Tool
echo.   (C) 2023 Xina, All rights reserved.
echo.   This software is a free software
echo.   published under GNU GPLv2 license.
echo.============================================
echo.NOTICE: CHANGES WILL TAKE EFFECT AFTER YOU
echo.        RESTART THE EXPLORER!
echo.
echo.Choose an operation:
echo.
echo.1. Enable Claasic Context Menu
echo.2. Restore Default Menu
echo.3. Restart Explorer
echo.4. Exit
echo.
set /p choice="Your choice:"
if "%choice%" == "1" (goto SET_CLASSIC_MENU)
if "%choice%" == "2" (goto RESTORE_DEFAULT_MENU)
if "%choice%" == "3" (goto RESTART_EXPLORER)
if "%choice%" == "4" (exit)
echo.Invalid input.
pause
goto MENU


:SET_CLASSIC_MENU
cls
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
pause
goto MENU

:RESTORE_DEFAULT_MENU
cls
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
pause
goto MENU

:RESTART_EXPLORER
cls
taskkill /f /im explorer.exe 
start explorer.exe
pause
goto MENU