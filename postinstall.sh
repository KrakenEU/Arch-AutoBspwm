#!/bin/bash

echo -ne "\n[+] Fixing .zshrc\n"

cp configurations/zshrc_template ~/.zshrc

# Installing blackarch :)
echo -ne "\n[+] Installing blackarch repo :)\n"
curl -O https://blackarch.org/strap.sh
sudo sh strap.sh

echo -ne "\n[+] Cleaning up...\n"
cd $HOME
sudo find / -type d -name "ArchBspwm" -exec rm -rf {} + 2>/dev/null
sudo pacman -Rs $(pacman -Qqtd) --noconfirm 

echo -ne "\n[+] DONE!\n"
