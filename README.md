# Arch-AutoBspwm
This repo gives a detailed installation process of arch linux (in vmware). And offers an "Auto BSPWM script" to configure everything with the environment I use as a template.

I'm no magician, nor creator of anything you see, I'm just offering my autoconfiguration scripts that uses public tools. Because those who spend more time customizing than hacking will get stuck :)


## Arch Installation

### THIS INSTALLATION IS INTENDED FOR VMWARE, MAKE SURE TO ENABLE 3D ACCEL

Download your iso file: https://archlinux.org/download/

1. archinstall
	- disk partitioning 
		- Use best effort -> ext4 -> no partition /home
 	 - Audio
		- pipewire
   	- Network 
		- NetworkManager
	- the rest is up to you


2. Manual installations after archinstall step

Basic packages installation

```
pacman -S xorg xorg-server xorg-xinit xfce4 xfce4-goodies lightdm lightdm-gtk-greeter

pacman -S kitty git nano firefox

systemctl enable NetworkManager.service
sudo systemctl enable lightdm.service
```

(edit /etc/hosts)

```
127.0.0.1     localhost
::1           localhost
127.0.1.1     <your_hostname>.localdomain <your_hostname>
```

Vmware Guest Additions

```
sudo pacman -S open-vm-tools
sudo systemctl enable vmtoolsd.service
sudo systemctl enable vmware-vmblock-fuse.service
sudo pacman -S gtkmm3
```

Reboot :)

```
exit
reboot
```

## Bspwm Auto Installation

```
git clone https://github.com/KrakenEU/Arch-AutoBspwm/
cd Arch-AutoBspwm
sh install.sh
```

After the script finishes, run the postinstall script to install blackarch if wanted, configure .zshrc and cleanup

```
sh postinstall.sh
```

