#! /bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

username=""
password=""

read -p "Username: " username
while true; do
  read -s -p "Password: " password
  echo
  read -s -p "Password (again): " password2
  echo
  [ "$password" = "$password2" ] && break || echo "Please try again"
done

hash=$(echo -e "${password}\n${password}" | LC_ALL=C /usr/bin/grub-mkpasswd-pbkdf2 | awk '/hash of / {print $NF}')
echo "#! /bin/bash
exec tail -n +3 \$0
set superusers=\"root\"
password_pbkdf2 root $hash
export superusers
set unrestricted_menu=\"y\"
export unrestricted_menu" >> /etc/grub.d/45_password
