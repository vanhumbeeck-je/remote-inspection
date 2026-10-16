# Changelog

Release notes for every version. The section of a version is published as its release notes; keep
the heading format `## <version>`.

## 1.4.0

- Released as a signed Debian package (`remote-inspection`) with automatic updates through
  `apt upgrade`; install with one command from the release page.
- Updates never change a Pi's network settings; the first installation still prepares wired links
  without a DHCP server.
- A packaged Pi hands new Pis the public installer (`http://inspection.local/install.sh`).
- Removing the software now also removes its network power-saving settings.

## 1.3.1

- Hidden networks that are out of range are saved for later; a silent connection to a Pi is noticed
  within 40 s.

## 1.3.0

- Pis join WiFi from the dashboard (one or many at once), from a QR code shown to the camera, or
  through their own fallback hotspot.
