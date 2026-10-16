#!/usr/bin/env bash
#
# Remote Inspection installer for Raspberry Pi OS (64-bit, Bookworm or Trixie).
# Adds the signed Remote Inspection package repository and installs the node software.
#
#   curl -fsSL https://vanhumbeeck-je.github.io/remote-inspection/install.sh | sudo bash                 stable releases
#   curl -fsSL https://vanhumbeeck-je.github.io/remote-inspection/install.sh | sudo bash -s -- --beta    also pre-releases
#
# Updates afterwards:  sudo apt update && sudo apt upgrade
set -euo pipefail
REPO_URL="https://vanhumbeeck-je.github.io/remote-inspection"
KEYRING=/usr/share/keyrings/remote-inspection.gpg
SOURCES=/etc/apt/sources.list.d/remote-inspection.sources

log() { printf '\033[1;36m==>\033[0m %s\n' "$*"; }
die() { printf '\033[1;31mERROR:\033[0m %s\n' "$*" >&2; exit 1; }

channel=""
for a in "$@"; do
  case "$a" in
    --beta) channel="-beta" ;;
    --stable) channel="" ;;
    -h|--help) sed -n '2,9p' "$0" 2>/dev/null || true; exit 0 ;;
  esac
done

[ "$(id -u)" -eq 0 ] || die "run with sudo"
command -v apt-get >/dev/null 2>&1 || die "this needs Raspberry Pi OS (or another Debian)"
arch="$(dpkg --print-architecture)"
[ "$arch" = arm64 ] || die "this needs the 64-bit Raspberry Pi OS (found: $arch)"
codename="$(. /etc/os-release && echo "${VERSION_CODENAME:-}")"
case "$codename" in
  bookworm|trixie) ;;
  *) die "Raspberry Pi OS Bookworm or Trixie is needed (found: ${codename:-unknown})" ;;
esac

log "Adding the Remote Inspection package repository (${codename}${channel})"
install -d -m 755 /usr/share/keyrings
tmp="$(mktemp)"
curl -fsSL "$REPO_URL/remote-inspection.gpg" -o "$tmp" || die "cannot download the signing key: is the Pi on the internet?"
install -m 644 "$tmp" "$KEYRING"
rm -f "$tmp"
cat > "$SOURCES" <<SRC
# Remote Inspection packages (maintained by the remote-inspection package)
Types: deb
URIs: $REPO_URL/apt
Suites: ${codename}${channel}
Components: main
Signed-By: $KEYRING
SRC

log "Installing remote-inspection"
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y remote-inspection
log "Done. Updates: sudo apt update && sudo apt upgrade"
