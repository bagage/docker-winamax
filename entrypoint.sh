#!/bin/bash -x

exe_winamax="$HOME/.wine/drive_c/users/$USER/Winamax/Winamax Poker/Winamax Poker.exe"
exe_install="/wamInstall.exe"
if [ ! -f "$exe_winamax" ]; then
  echo "installing (1/2)…"
  wine "$exe_install"
  echo "installing (2/2)…"
  wine "$exe_install"
  echo "installed!"
fi

echo "starting winamax…"
wine "$exe_winamax" | cat || echo "failed to start!"
echo "exiting…"
