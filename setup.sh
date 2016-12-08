#!/bin/bash

mkdir install-sh
cd install-sh
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/install.sh
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/chroot_setup.sh
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/chroot_setup.sh

mkdir setting
cd setting
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/setting/user.txt
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/setting/mirrorlist
wget https://raw.githubusercontent.com/mute1997/archlinuxInstaller-sh/master/setting/netctl_setting

cd ..
chmod +x install.sh
./install.sh
