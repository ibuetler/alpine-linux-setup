#!/bin/ash

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

# add user
adduser ibuetler
mkdir -p /home/ibuetler/wallpaper
mkdir -p /home/ibuetler/.config/i3

# user setup ibuetler
cp ./ibuetler/wallpaper/compass.jpg /home/ibuetler/wallpaper/compass.jpg
cp ./ibuetler/.config/i3/config /home/ibuetler/.config/i3/config
cp ./ibuetler/.profile /home/ibuetler/.profile
mkdir -p /home/ibuetler/.scripts
cp ./ibuetler/login-script.sh /home/ibuetler/.scripts/login-script.sh
chown -R ibuetler:ibuetler /home/ibuetler

# add ibuetler to sudoers
cat ./ibuetler/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/ibuetler/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./ibuetler/ibuetler /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/ibuetler

# add user to docker
addgroup ibuetler docker

# enable copy paste in vmware
chmod g+s /usr/bin/vmware-user-suid-wrapper

# give ibuetler write access to /opt dir
chown ibuetler:ibuetler /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown ibuetler:ibuetler /opt/docker


