# hardened-tumbleweed

## About The Project

hardened-tumbleweed is a program, or more correctly a collection of scripts, that is designed to harden any openSUSE Tumbleweed installation as much as possible. The project specifically aims to harden your GNU/Linux workstation. This hardening is not aimed for servers. The project is also able to reverse every piece of hardening it does. The following content is covered, and new options are on the way, the project is not complete yet. For the time being, do no proceed without prior testing in a safe environment.

* Kernel Settings Hardening
* Kernel Modules Hardening
* Network Hardening
* Mac-address randomization
* Disabling Core Dumps
* Hardened Boot Parameters
* Firewall Configuration
* Entropy Improvements
* Brute Force Protection
* Access Rights Hardening
* Improved password hashing
* Hardened home directories
* Improved banners when logging in
* Improved Bluetooth options
* (Feature complete, but not 'fully' tested just yet) Hardened mount options
* (Feature complete, but not 'fully' tested just yet) Hardened umask
* (WIP) Using hardened-malloc by the GrapheOS Project by default for all 'root' processes
* (WIP) Improving Mandatory Access Control
* (WIP) Installing Various Packages for Security
* (WIP) Securing all the outgoing connections by Zypper with HTTPS
* (WIP) Configuring USB-Guard
* (WIP) Configuring entropy daemons
* (WIP) Displaying a warning banner also in GUI login on GNOME
* (WIP) Forcing native wayland if supported and refraining from XWayland as much as possible
* (WIP) Systemd hardening

## Before Getting Started 

This collection of hardening script and configuration files is targeted to be used on openSUSE Tumbleweed, and on personal computers, not servers. Most functionality might work on other distros, but some of them won't and this also applies to other RPM-based distros. On Tumbleweed, the project aims to be a no-config, install and forget kind of program. No configuration is expected on the user end. Everything is automated and will work in any case. The program adapts to different Tumbleweed systems with different packages installed, different partitioning schemes and different file systems. The user does not need to worry about compatibility, give they are on openSUSE Tumbleweed and using it as their workstation. Needless to say, back up your sensitive data. Especially now that the project is not complete yet, also do your testing in a VM first. There are no 'dependencies' per se. But it is 'assumed' you are on a x86_64 system. Your Tumbleweed installation can be very different and unique and the hardening will still work, but don't go too far as to changing the init system or replacing the GNU core utils.

For the most part, the project is not 'completely' tested, expecially not all component as a whole. This will happen very shortly, and the project will be more or less complete in a short time.

## Usage

### Running/Installing

You can either ```git clone``` the repository or do a manual download using your browser. Then, depending what you want, you would just have to run the scripts ```hardening_apply``` or ```hardening_reverse```, that are in the main diretory.

## Sources

When preparing this script I used various tools and sources. The most notable tool I used is [Lynis](https://cisofy.com/lynis/). 
This project is also somewhat losely based on one of my previous projects, namely ['chainmail'](https://github.com/monsieuremre/chainmail) that does similar stuff but on debian.

Notable resources I used for the aforementioned project and by extension this one are:
* [Kicksecure Wiki](https://www.kicksecure.com/wiki/)
* [Kernel Self Protection Project](https://kernsec.org/wiki/)
* [Whonix Forums | Kernel Hardening - security-misc](https://forums.whonix.org/t/kernel-hardening-security-misc/7296/43)
* [Securing Debian Manual](https://www.debian.org/doc/manuals/securing-debian-manual/index.en.html)
* [Debian | Setup Guides - Secure Personal Computer](https://wiki.debian.org/SetupGuides/SecurePersonalComputer)

## Contributing

The fact that anybody can contribute is what makes Free and Open Source Software the best tool to learn and create.
If you have any suggestions regarding the project, do not hesitate fork the repo and create a pull request.

## License

hardened-tumbleweed is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. 

See [LICENSE](LICENSE) for more details.

## Contact

If you need to contact me regarding the project for any reason, please open an issue or create a pull request.

Project Link: [https://github.com/monsieuremre/hardened-tumbleweed](https://github.com/monsieuremre/hardened-tumbleweed)
