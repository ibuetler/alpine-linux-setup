#!/bin/ash

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service open-vm-tools start
rc-update add open-vm-tools boot

