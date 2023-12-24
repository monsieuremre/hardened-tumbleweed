#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

if [ -f /etc/hardened_tumbleweed/issue_old ]
then
    echo "Old configuration file is already backed up. Assuming hardening was already applied and skipping."
else
    mv /etc/issue /etc/hardened_tumbleweed/issue_old
    echo "By continuing to connect to this system, you consent to the owner storing a log of all activity.
Unauthorized access is prohibited and may result in legal action. Do not proceed!" >> /etc/issue
fi

if [ -f /etc/hardened_tumbleweed/issue_old ]
then
    echo "Old configuration file is already backed up. Assuming hardening was already applied and skipping."
else
    mv /etc/issue.net /etc/issue.net_old
    echo "By continuing to connect to this system, you consent to the owner storing a log of all activity.
Unauthorized access is prohibited and may result in legal action. Do not proceed!" >> /etc/issue.net
fi
