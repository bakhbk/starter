#!/usr/bin/env bash
set -euo pipefail

MIN_VER="0.11.2"
REPO="neovim/neovim"

version_ge() {
  # return 0 if $1 >= $2
  if command -v dpkg >/dev/null 2>&1; then
    dpkg --compare-versions "$1" ge "$2" && return 0 || return 1
  fi
  python3 - "$1" "$2" <<'PY'
import sys
from distutils.version import LooseVersion
sys.exit(0 if LooseVersion(sys.argv[1]) >= LooseVersion(sys.argv[2]) else 1)
PY
}

get_nvim_version() {
  if ! command -v nvim >/dev/null 2>&1; then
    return 1
  fi
  nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//' || return 1
}

installed_version=$(get_nvim_version || true)
if [[ -n "$installed_version" ]] && version_ge "$installed_version" "$MIN_VER"; then
  echo "✓ Neovim $installed_version (>= $MIN_VER)"
  exit 0
fi

echo "Installing/Updating Neovim to >= $MIN_VER..."

if command -v brew >/dev/null 2>&1; then
  echo "Using Homebrew..."
  if brew list --versions neovim >/dev/null 2>&1; then
    brew upgrade neovim || brew install neovim
  else
    brew install neovim
  fi
  exit 0
fi

if command -v apt-get >/dev/null 2>&1; then
  echo "Using apt..."
  SUDO="sudo"
  if [[ $(id -u) -eq 0 ]]; then
    SUDO=""
  fi

  ${SUDO} apt-get update
  if ! command -v add-apt-repository >/dev/null 2>&1; then
    ${SUDO} apt-get install -y software-properties-common
  fi
  ${SUDO} add-apt-repository -y ppa:neovim-ppa/stable || true
  ${SUDO} apt-get update
  ${SUDO} apt-get install -y neovim || true

  newver=$(get_nvim_version || true)
  if [[ -n "$newver" ]] && version_ge "$newver" "$MIN_VER"; then
    echo "✓ Neovim $newver installed via apt"
    exit 0
  fi

  echo "apt package is older than $MIN_VER, removing apt package and falling back to AppImage..."
  ${SUDO} apt-get remove -y neovim || true

  # Choose asset based on host architecture (x86_64 / aarch64 / arm64)
  ARCH=$(uname -m)
  case "$ARCH" in
  x86_64 | amd64) ARCH_RE='x86_64|linux64|linux-x86_64|linux64' ;;
  aarch64 | arm64) ARCH_RE='aarch64|arm64|linux-aarch64' ;;
  *) ARCH_RE='' ;;
  esac

  # Prefer AppImage or linux tarball matching architecture
  url=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" |
    grep '"browser_download_url"' |
    cut -d '"' -f4 |
    grep -Ei "(appimage|linux)" |
    grep -Ei "$ARCH_RE" |
    head -n1 || true)

  # Fallback: any appimage or linux asset
  if [[ -z "$url" ]]; then
    url=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" |
      grep '"browser_download_url"' |
      cut -d '"' -f4 |
      grep -Ei "(appimage|linux)" |
      head -n1 || true)
  fi

  if [[ -z "$url" ]]; then
    echo "❌ Couldn't find suitable Neovim asset in releases"
    exit 1
  fi

  tmpfile=$(mktemp -t nvim_asset.XXXXXX)
  curl -L "$url" -o "$tmpfile"

  # If AppImage -> install directly
  if echo "$url" | grep -qi appimage; then
    ${SUDO} install -m755 "$tmpfile" /usr/local/bin/nvim
    rm -f "$tmpfile"
    echo "✓ Installed AppImage to /usr/local/bin/nvim"
    exit 0
  fi

  # If tarball -> extract nvim binary
  if echo "$url" | grep -E "\.tar\.gz$|\.tar\.xz$|nvim-linux" -qi; then
    tmpdir=$(mktemp -d -t nvim_unpack.XXXXXX)
    tar -C "$tmpdir" -xzf "$tmpfile" 2>/dev/null || tar -C "$tmpdir" -xf "$tmpfile"
    nvimbin=$(find "$tmpdir" -type f -path '*/bin/nvim' -print -n 1 || true)
    if [[ -n "$nvimbin" ]]; then
      ${SUDO} install -m755 "$nvimbin" /usr/local/bin/nvim
      rm -rf "$tmpdir" "$tmpfile"
      echo "✓ Installed nvim from tarball to /usr/local/bin/nvim"
      exit 0
    else
      rm -rf "$tmpdir" "$tmpfile"
      echo "❌ Couldn't locate nvim binary inside archive"
      exit 1
    fi
  fi

  # Unknown asset type: try to install directly
  ${SUDO} install -m755 "$tmpfile" /usr/local/bin/nvim || {
    echo "❌ Failed to install asset"
    rm -f "$tmpfile"
    exit 1
  }
  rm -f "$tmpfile"
  echo "✓ Installed asset to /usr/local/bin/nvim"
  exit 0
fi

echo "OS not explicitly supported by this installer. Attempting to download AppImage if available..."
url=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" |
  grep "browser_download_url" |
  grep "nvim.appimage" |
  head -n1 |
  cut -d '"' -f4 || true)
if [[ -n "$url" ]]; then
  sudo curl -L "$url" -o /usr/local/bin/nvim
  sudo chmod +x /usr/local/bin/nvim
  echo "✓ Installed AppImage to /usr/local/bin/nvim"
  exit 0
fi

echo "Please install Neovim >= $MIN_VER manually."
exit 1
