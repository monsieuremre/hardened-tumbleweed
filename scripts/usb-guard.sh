#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.


if [ ! -f /etc/usbguard/rules.conf ]
then
touch /etc/usbguard_installed
zypper install usbguard-tools --non-interactive
usbguard generate-policy > /etc/usbguard/rules.conf
echo "allow with-interface equals { 08:*:* }
reject with-interface all-of { 08:*:* 03:00:* }
reject with-interface all-of { 08:*:* 03:01:* }
reject with-interface all-of { 08:*:* e0:*:* }
reject with-interface all-of { 08:*:* 0a:*:* }
reject with-interface all-of { 08:*:* 02:*:* }" >> /etc/usbguard/rules.conf
systemctl enable --now usbguard
fi
