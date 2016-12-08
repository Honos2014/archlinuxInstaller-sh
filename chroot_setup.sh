#!/bin/bash

ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

#locale
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen

#bootloader
yes | pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#netctl
yes | pacman -S netctl
netctl enable eth0
