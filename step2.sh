#!/bin/ash

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash termite zsh dbus dbus-x11
setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh
apk add firefox-esr
apk add accountsservice

# add user
adduser ibuetler
mkdir -p /home/ibuetler/wallpaper
mkdir -p /home/ibuetler/.config/i3

# wallpapers
cp ./ibuetler/wallpaper/compass.jpg /home/ibuetler/wallpaper/compass.jpg
cp ./ibuetler/.config/i3/config /home/ibuetler/.config/i3/config
cp ./ibuetler/.profile /home/ibuetler/.profile
chown -R ibuetler:ibuetler /home/ibuetler
cat ./sudoers >> /etc/sudoers

# greeter background
echo "background=/home/ibuetler/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./ibuetler/ibuetler /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/ibuetler
