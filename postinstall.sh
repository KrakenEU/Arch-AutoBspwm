#!/bin/bash

echo -ne "\n[+] Fixing .zshrc\n"

cp configurations/zshrc_template ~/.zshrc

# make symlink in root
sudo ln -sf $HOME/.zshrc /root/.zshrc
sudo chsh -s /usr/bin/zsh root 

# Installing blackarch :) (comment out to ommit)
echo -ne "\n[+] Installing blackarch repo :)\n"
curl -O https://blackarch.org/strap.sh
sudo sh strap.sh

# clean orphans if needed
echo -ne "\n[+] Cleaning up...\n"
sudo pacman -Rs $(pacman -Qqtd) --noconfirm 

echo -ne "\n[+] DONE!\n"
