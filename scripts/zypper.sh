#!/bin/bash

## This file is part of hardened-tumbleweed <https://github.com/monsieuremre/hardened-tumbleweed>
## hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
## version. hardened-tumbleweed is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details. You should have received a copy of the GNU General Public License along with this program. If not, see
## <https://www.gnu.org/licenses/>.

mkdir /etc/zypp_repos.d_old
for file in $(find /etc/zypp/repos.d/ -type f)
do
cp $file /etc/zypp_repos.d_old/ 
sed -i 's/http:/https:/g' $file
done
