#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

my_dir="$(dirname "$0")"

if [ ! -d "/etc/bluetooth" ]
then
    mkdir -p /etc/bluetooth
fi
cp $my_dir/../config_files/bluetooth/hardened-tumbleweed.conf /etc/bluetooth/hardened-tumbleweed.conf

if [ ! -d "/etc/default/grub.d" ]
then
    mkdir -p /etc/default/grub.d
fi
cp $my_dir/../config_files/default/grub.d/40_hardened-tumbleweed.cnf /etc/default/grub.d/40_hardened-tumbleweed.cnf

if [ ! -d "/etc/modprobe.d" ]
then
    mkdir -p /etc/modprobe.d
fi
cp $my_dir/../config_files/modprobe.d/20_hardened-tumbleweed.conf /etc/modprobe.d/20_hardened-tumbleweed.conf

if [ ! -d "/etc/NetworkManager/conf.d" ]
then
    mkdir -p /etc/NetworkManager/conf.d
fi
cp $my_dir/../config_files/NetworkManager/conf.d/20_hardened-tumbleweed.conf /etc/NetworkManager/conf.d/20_hardened-tumbleweed.conf

if [ ! -d "/etc/permissions.d" ]
then
    mkdir -p /etc/permissions.d
fi
cp $my_dir/../config_files/permissions.d/30_hardened-tumbleweed /etc/permissions.d/30_hardened-tumbleweed
cp $my_dir/../config_files/permissions.d/40_hardened-tumbleweed /etc/permissions.d/40_hardened-tumbleweed

if [ ! -d "/etc/profile.d" ]
then
    mkdir -p /etc/profile.d
fi
cp $my_dir/../config_files/profile.d/20_hardened-tumbleweed.sh /etc/profile.d/20_hardened-tumbleweed.sh

if [ ! -d "/etc/security/limits.d" ]
then
    mkdir -p /etc/security/limits.d
fi
cp $my_dir/../config_files/security/limits.d/20_hardened-tumbleweed.conf /etc/security/limits.d/20_hardened-tumbleweed.conf

if [ ! -d "/etc/systemctl.d" ]
then
    mkdir -p /etc/systemctl.d
fi
cp $my_dir/../config_files/systemctl.d/99_hardened-tumbleweed.conf /etc/systemctl.d/99_hardened-tumbleweed.conf

if [ ! -d "/etc/systemd/coredump.conf.d" ]
then
    mkdir -p /etc/systemd/coredump.conf.d
fi
cp $my_dir/../config_files/systemd/coredump.conf.d/20_hardened-tumbleweed.conf /etc/systemd/coredump.conf.d/20_hardened-tumbleweed.conf

if [ ! -d "/etc/systemd/networkd.conf.d" ]
then
    mkdir -p /etc/systemd/networkd.conf.d
fi
cp $my_dir/../config_files/systemd/networkd.conf.d/20_hardened-tumbleweed.conf /etc/systemd/networkd.conf.d/20_hardened-tumbleweed.conf
