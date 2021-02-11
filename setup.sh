#!/bin/ash

echo "http://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories
apk update
apk upgrade
apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash termite zsh
setup-xorg-base xfce4 xfce4-terminal ligthdm-gtk-greeter dbus-x11 i3wm
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib glapi feh
apk add firefox-esr
apk add accountsservice

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service open-vm-tools start
rc-update add open-vm-tools boot

adduser ibuetler
mkdir -p /home/ibuetler/wallpaper
mkdir -p /home/ibuetler/.config/i3

cp ./ibuetler/wallpaper/compass.jpg /home/ibuetler/wallpaper/compass.jpg
cp ./ibuetler/.config/i3/config /home/ibuetler/.config/i3/config
cp ./ibuetler/.profile /home/ibuetler/.profile
chown -R ibuetler:ibuetler /home/ibuetler
