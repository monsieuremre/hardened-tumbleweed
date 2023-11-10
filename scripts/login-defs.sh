#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

cp /etc/login.defs /etc/login.defs_old
echo "SHA_CRYPT_MIN_ROUNDS 10000
SHA_CRYPT_MAX_ROUNDS 100000" >> /etc/login.defs

echo "HOME_MODE      0700" >> /etc/login.defs
