#!/bin/bash

### Updating System
sudo pacman -Syu --noconfirm

echo "Finished System Update"

### YAY Install
cd
mkdir -p Downloads/Git
cd Downloads/Git

git clone https://aur.archlinux.org/yay.git
sudo chown -R paranoia-agent:users ./yay
cd yay
makepkg -si --noconfirm

echo "Finished YAY Install"

### Pacman Packages
sudo pacman -S  bspwm sxhkd rofi dunst sddm-runit xfce4-power-manager xfce4-settings thunar thunar-archive-plugin gvfs-mtp ranger w3m ffmpegthumbnailer feh neofetch pulseaudio pulseaudio-alsa pavucontrol polkit-gnome mousepad vim htop wget iwd-runit wireless_tools wpa_supplicant-runit xdg-utils xdg-user-dirs xf86-input-wacom noto-fonts noto-fonts-cjk --noconfirm

echo "Finished Installing Pacman Packages"

### AUR Packages
yay -S  picom-jonaburg-git polybar playerctl-git zscroll-git kitty-git udevil-git flameshot-git starship-git pywal-git zathura-git zathura-pdf-poppler-git rofi-dmenu networkmanager-dmenu-git i3lock-color xidlehook themix-full-git bibata-cursor-theme nerd-fonts-hack nerd-fonts-jetbrains-mono --noconfirm

echo "Finished Installing AUR Packages"

sudo pacman -Rns i3 --noconfirm

cd
sudo chmod +x .config/polybar/player.sh
sudo chmod +x .config/i3lock/lockscreen
sudo chmod +x .config/bspwm/bspwmrc

sudo systemctl enable sddm
ln -s /etc/runit/sv/sddm/ /run/runit/service

echo "Finished Setup"
