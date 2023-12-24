#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

if [ -f /etc/hardened_tumbleweed/pam.d_passwd_old ]
then
    echo "Old configuration file is already backed up. Assuming hardening was already applied and skipping."
else
    cp /etc/pam.d/passwd /etc/hardened_tumbleweed/pam.d_passwd_old
    echo "password required pam_unix.so sha512 shadow nullok rounds=65536" >> /etc/pam.d/passwd
fi

if [ -f /etc/hardened_tumbleweed/pam.d_common-session_old ]
then
    echo "Old configuration file is already backed up. Assuming hardening was already applied and skipping."
else
    cp /etc/pam.d/common-session /etc/hardened_tumbleweed/pam.d_common-session_old
    echo "session optional pam_umask.so umask=0027
session [default=1 success=ignore] pam_succeed_if.so quiet user ingroup secret-agents
session optional pam_umask.so umask=0077" >> /etc/pam.d/common-session
fi

if [ -f /etc/hardened_tumbleweed/pam.d_system-login_old ]
then
    echo "Old configuration file is already backed up. Assuming hardening was already applied and skipping."
else
    cp /etc/pam.d/system-login /etc/hardened_tumbleweed/pam.d_system-login_old
    echo "auth optional pam_faildelay.so delay=4000000" >> /etc/pam.d/system-login
fi
