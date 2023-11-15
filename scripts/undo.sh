#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

mv -f /etc/issue_old /etc/issue
mv -f /etc/issue.net_old /etc/issue.net
mv -f /etc/fstab_old /etc/fstab
mv -f /etc/pam.d_passwd_old /etc/pam.d/passwd 
mv -f /etc/pam.d_common-session_old /etc/pam.d/common-session
mv -f /etc/pam.d_system-login_old /etc/pam.d/system-login
mv -f /etc/firewalld_firewalld.conf_old /etc/firewalld/firewalld.conf

rm /etc/bluetooth/hardened-tumbleweed.conf
rm /etc/default/grub.d/40_hardened-tumbleweed
rm /etc/default/grub.d/45_password
rm /etc/modprobe.d/20_hardened-tumbleweed.conf
rm /etc/NetworkManager/conf.d/20_hardened-tumbleweed.conf
rm /etc/permissions.d/30_herdened-tumbleweed
rm /etc/permissions.d/40_herdened-tumbleweed
rm /etc/profile.d/20_hardened-tumbleweed.sh
rm /etc/security/limits.d/20_hardened-tumbleweed.conf
rm /etc/systemctl.d/99_hardened-tumbleweed.conf
rm /etc/systemd/coredump.conf.d/20_hardened-tumbleweed.conf
rm /etc/systemd/networkd.conf.d/20_hardened-tumbleweed.conf

for file in $(find /etc/zypp_repos.d_old -type f)
do
mv -f $file /etc/zypp/repos.d/
rm $file
done

rm -rf /etc/zypp_repos.d_old

if [ -f /etc/usbguard_installed ]
then
zypper remove usbguard-tools --non-interactive
rm /etc/usbguard_installed
fi

if [ -f /etc/haveged_installed ]
then
zypper remove haveged --non-interactive
rm /etc/haveged_installed
fi
