#!/bin/bash

echo -ne "\n[+] Fixing .zshrc\n"

cp configurations/zshrc_template ~/.zshrc

# make symlink in root
sudo ln -sf $HOME/.zshrc /root/.zshrc
sudo chsh -s /usr/bin/zsh root 

## blackarch
curl -O https://blackarch.org/strap.sh
sudo sh strap.sh

# clean
echo -ne "\n[+] Cleaning up...\n"
sudo pacman -Sy archlinux-keyring

echo -ne "\n[+] DONE!\n"
