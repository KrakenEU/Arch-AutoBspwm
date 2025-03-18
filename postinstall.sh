#!/bin/bash

echo -ne "\n[+] Fixing .zshrc\n"

cp zshrc_template ~/.zshrc

echo -ne "\n[+] Cleaning up...\n"
sudo find / -type d -name "ArchBspwm" -exec rm -rf {} + 2>/dev/null
sudo pacman -Rs $(pacman -Qqtd) --noconfirm 

echo -ne "\n[+] DONE!\n"
