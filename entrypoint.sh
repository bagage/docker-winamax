#!/bin/bash

exe_winamax="/root/.wine/drive_c/users/root/Winamax/Winamax Poker/Winamax Poker.exe"
exe_install="/WinamaxInstall.exe"
if [ ! -f "$exe_winamax" ]; then
  wine32 "$exe_install"
  wine "$exe_install"
fi

wine "$exe_winamax"
