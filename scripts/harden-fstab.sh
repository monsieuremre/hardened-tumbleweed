#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

cp /etc/fstab /etc/fstab_old
(grep -o '^[^#]*' /etc/fstab_old) >> /etc/fstab

if [ ! -z "$(awk '$2=="/home"' /etc/fstab)" ]
then
awk '$2=="/home" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/home" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
else
echo "/home /home none defaults,bind,nosuid,nodev 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/tmp"' /etc/fstab)" ]
then
awk '$2=="/tmp" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/tmp" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/tmp" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "tmpfs /tmp tmpfs defaults,nodev,nosuid,noexec 0 0" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/var/tmp"' /etc/fstab)" ]
then
awk '$2=="/var/tmp" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/tmp" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/tmp" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "/tmp /var/tmp none defaults,bind,nosuid,nodev,noexec 0 0" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/var/log/audit"' /etc/fstab)" ]
then
awk '$2=="/var/log/audit" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/log/audit" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/log/audit" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/var/log"' /etc/fstab)" ]
then
awk '$2=="/var/log" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/log" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var/log" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "/var/log /var/log none defaults,bind,nosuid,nodev,noexec 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/var"' /etc/fstab)" ]
then
awk '$2=="/var" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/var" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
else
echo "/var /var none defaults,bind,nosuid,nodev 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/dev/shm"' /etc/fstab)" ]
then
awk '$2=="/dev/shm" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/dev/shm" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/dev/shm" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "tmpfs /dev/shm tmpfs defaults,nosuid,nodev,noexec 0 0" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/dev"' /etc/fstab)" ]
then
awk '$2=="/dev" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/dev" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "udev /dev devtmpfs defaults,nosuid,nodev,noexec 0 0" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/usr/share"' /etc/fstab)" ]
then
awk '$2=="/usr/share" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/usr/share" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
else
echo "/usr/share /usr/share none defaults,bind,nosuid,nodev 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/usr"' /etc/fstab)" ]
then
awk '$2=="/usr" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
else
echo "/usr /usr none defaults,bind,nodev 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/boot/efi"' /etc/fstab)" ]
then
awk '$2=="/boot/efi" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/boot/efi" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/boot/efi" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/boot"' /etc/fstab)" ]
then
awk '$2=="/boot" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/boot" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/boot" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "/boot /boot none defaults,bind,nodev,nosuid,noexec 0 2" >> /etc/fstab
fi

if [ ! -z "$(awk '$2=="/root"' /etc/fstab)" ]
then
awk '$2=="/root" && $4!~"nosuid" {$4=$4",nosuid"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/root" && $4!~"nodev" {$4=$4",nodev"} 1' /etc/fstab >> /etc/fstab
awk '$2=="/root" && $4!~"noexec" {$4=$4",noexec"} 1' /etc/fstab >> /etc/fstab
else
echo "/root /root none defaults,bind,nodev,nosuid,noexec 0 2" >> /etc/fstab
fi
