#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

mv -f /etc/hardened_tumbleweed/issue_old /etc/issue
mv -f /etc/hardened_tumbleweed/issue.net_old /etc/issue.net
mv -f /etc/hardened_tumbleweed/fstab_old /etc/fstab
mv -f /etc/hardened_tumbleweed/pam.d_passwd_old /etc/pam.d/passwd 
mv -f /etc/hardened_tumbleweed/pam.d_common-session_old /etc/pam.d/common-session
mv -f /etc/hardened_tumbleweed/pam.d_system-login_old /etc/pam.d/system-login
mv -f /etc/hardened_tumbleweed/firewalld_firewalld.conf_old /etc/firewalld/firewalld.conf

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

rm -rf /etc/hardened_tumbleweed/zypp_repos.d_old

if [ -f /etc/hardened_tumbleweed/usbguard_installed ]
then
    zypper --non-interactive remove usbguard-tools
    rm /etc/usbguard_installed
fi

if [ -f /etc/hardened_tumbleweed/haveged_installed ]
then
    zypper --non-interactiveremove haveged
    rm /etc/haveged_installed
fi
