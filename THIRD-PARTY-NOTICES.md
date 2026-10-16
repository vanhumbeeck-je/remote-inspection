# Third-party notices

Remote Inspection depends on the following open-source software. These components are **not
bundled**: they are installed from Raspberry Pi OS / Debian as separate packages, unmodified, under
their own licences (see `/usr/share/doc/<package>/copyright` on the Pi).

| Component | Debian package | Licence |
| --- | --- | --- |
| Python | python3 | Python Software Foundation License |
| aiohttp | python3-aiohttp | Apache License 2.0 |
| dbus-fast / dbus-next | python3-dbus-fast / python3-dbus-next | MIT |
| NumPy | python3-numpy | BSD 3-Clause |
| Pillow | python3-pil | MIT-CMU (HPND) |
| ZBar | python3-zbar | LGPL 2.1 |
| Avahi | avahi-daemon, avahi-utils | LGPL 2.1 |
| FFmpeg | ffmpeg | LGPL 2.1+ / GPL 2+ |
| rpicam-apps / libcamera | rpicam-apps-lite | BSD 2-Clause / LGPL 2.1 |
| ALSA utilities | alsa-utils | GPL 2 |
| v4l-utils | v4l-utils | GPL 2 / LGPL 2.1 |
| NetworkManager | network-manager | GPL 2+ |
| dnsmasq | dnsmasq-base | GPL 2 / 3 |
| polkit | polkitd | LGPL 2 |
| iw | iw | ISC |

The service is compiled with [Nuitka](https://nuitka.net/) (Apache License 2.0).
