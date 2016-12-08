#!/bin/bash

rootpw=`sed -n 2p ./setting/user.txt`
user=`sed -n 4p ./setting/user.txt`
pass=`sed -n 6p ./setting/user.txt`

fdisk /dev/sda <<EOF
g
n



w
EOF
mkfs.ext4 /dev/sda1

mount /dev/sda1 /mnt
mkdir /mnt/boot

timedatectl set-ntp true

cat mirrorlist > /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

#chroot setup
echo useradd -D ${user} >> ./chroot_setup.sh
echo echo root:${rootpw} | chpasswd >> ./chroot_setup.sh
echo echo ${user}:${pass} | chpasswd >> ./chroot_setup.sh

chmod +x ./chroot_setup.sh
cp ./chroot_setup.sh /mnt/chroot_setup.sh
cp ./setting/netctl_setting /mnt/etc/netctl/eth0

arch-chroot /mnt "/chroot_setup.sh"

#finish
umount -R /mnt
reboot
