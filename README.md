# Remote Inspection

Live camera and sound of your machines in any browser. Every Raspberry Pi that runs Remote
Inspection is an inspection point; all of them appear together on one dashboard at
`http://inspection.local/`. No cloud, no app, no account.

This page publishes the **releases**: signed packages for Raspberry Pi OS, the release notes and
the licence. The source code is not public.

## Requirements

- Raspberry Pi 5, 4, 3 or Zero 2 W with **64-bit Raspberry Pi OS** Bookworm or Trixie (Lite is enough)
- A Raspberry Pi camera module or a USB webcam; optionally a USB microphone
- Internet on the Pi while installing and updating

## Install

On the Pi:

```bash
curl -fsSL https://vanhumbeeck-je.github.io/remote-inspection/install.sh | sudo bash
```

Then open `http://inspection.local/` (or `http://<hostname>.local/`) on any PC, tablet or phone on
the same network. A Pi that already runs Remote Inspection installs a new one the same way:
`curl -fsSL http://inspection.local/install.sh | sudo bash`.

## Update

```bash
sudo apt update && sudo apt upgrade
```

Settings, names, alert rules and alert history are kept. Updates never change the Pi's network
settings.

## Pre-releases (beta)

```bash
curl -fsSL https://vanhumbeeck-je.github.io/remote-inspection/install.sh | sudo bash -s -- --beta
```

Back to stable releases only: run the installer again without `--beta`.

## Go back to an earlier version

The repository keeps the last five versions:

```bash
apt list -a remote-inspection                   # available versions
sudo apt install remote-inspection=<version>    # e.g. 1.4.0+deb13
```

## Remove

```bash
sudo apt remove remote-inspection    # keeps names, alerts and history
sudo apt purge remote-inspection     # removes everything
```

## Verify the packages

The repository is signed; apt checks every package against the key in
`/usr/share/keyrings/remote-inspection.gpg` (also published as
[remote-inspection.gpg](https://vanhumbeeck-je.github.io/remote-inspection/remote-inspection.gpg)).
Each release also lists the SHA-256 checksums of its packages.

## Licence

Remote Inspection is proprietary software: see [EULA.md](EULA.md). The open-source components it
uses are listed in [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md).
