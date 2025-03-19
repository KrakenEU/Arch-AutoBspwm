#!/bin/bash

#### install.sh
# Check UID
[ "$(id -u)" -eq 0 ] && echo "error: avoid running autoArch.sh as root/sudo." && exit


# install packages

echo -ne "\n[+] Installing required packages\n"
sudo pacman -S --noconfirm git kitty bspwm wmname firefox sxhkd polybar zsh feh picom ranger rofi dunst nano openssh openssl thunar unzip zsh fd npm noto-fonts-emoji zsh-syntax-highlighting zsh-autosuggestions wget

# create directories
echo -ne "\n[+] Setting up directories\n"
mkdir $HOME/.config
cp -r configurations/* $HOME/.config/

find $HOME/.config/polybar/ -type f -exec chmod +x {} \; 

mkdir $HOME/.local/share/fonts
cp -r fonts/* $HOME/.local/share/fonts
fc-cache -fv

sudo chmod +x ~/.config/sxhkd/sxhkdrc
sudo chmod +x ~/.config/bspwm/bspwmrc
sudo chmod +x ~/.config/polybar/launch.sh
sudo chmod +x ~/.config/bspwm/scripts/bspwm_resize

# setting up Oh My Zsh
echo -ne "\n[+] Setting up Oh My Zsh\n"
cd $HOME
sudo rm -rf $HOME/.oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
