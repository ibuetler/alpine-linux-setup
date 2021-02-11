#!/bin/ash

echo "http://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories
apk update
apk upgrade

adduser ibuetler
mkdir -p /home/ibuetler/wallpaper
mkdir -p /home/ibuetler/.config/i3

cp ./ibuetler/wallpaper/compass.jpg /home/ibuetler/wallpaper/compass.jpg
cp ./ibuetler/.config/i3/config /home/ibuetler/.config/i3/config
cp ./ibuetler/.profile /home/ibuetler/.profile
chown -R ibuetler:ibuetler /home/ibuetler


