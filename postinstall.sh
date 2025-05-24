#!/bin/bash

echo -ne "\n[+] Fixing .zshrc\n"

cp configurations/zshrc_template ~/.zshrc

# make symlink in root
sudo ln -sf $HOME/.zshrc /root/.zshrc
sudo chsh -s /usr/bin/zsh root 

# clean orphans if needed
echo -ne "\n[+] Cleaning up...\n"
sudo pacman -Sy archlinux-keyring
sudo pacman-key --refresh-keys

echo -ne "\n[+] DONE!\n"
