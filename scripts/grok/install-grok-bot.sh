#!/usr/bin/env bash
# Mirrors agents/grok/bot.md — Install.
set -euo pipefail

KEY_URL="https://downloads.cursor.com/keys/anysphere.asc"
REPO_URL="https://downloads.cursor.com/aptrepo"
SUITE="grok-bot"
KEYRING="/etc/apt/keyrings/cursor.gpg"
LIST_FILE="/etc/apt/sources.list.d/grok-bot.list"
PINNED_VERSION="0.30.0"
SHA256_AMD64="fb888b2204c8a51c71a9f5f9a2913ac10561f3ef6939c1245ecae4e837d4ada2"
SHA256_ARM64="7c4c81d576181a57b34b812258b2620626717cec84f100503a7363f37aa8e3fe"

GROK_BOT_VERSION="${GROK_BOT_VERSION:-$PINNED_VERSION}"

usage() {
  cat <<'EOF'
Usage: install-grok-bot.sh [--help] [--deb]

Install Grok Bot (desktop agent) on Debian/Ubuntu, amd64 or arm64.

  --help    Show this help and exit
  --deb     Direct .deb download with SHA256 verification (fallback method)
            Default is the APT repo method

Environment:
  GROK_BOT_VERSION    Package version (default: 0.30.0, as pinned in
                      agents/grok/bot.md). Used by --deb for the pool URL.

Needs an eligible paid plan, a Cursor account, and a graphical session.
Headless machines should use the Grok Build CLI instead (agents/grok/cli.md).
See agents/grok/bot.md.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

USE_DEB=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --deb)
      USE_DEB=1
      shift
      ;;
    *)
      die "unknown argument: $1 (see --help)"
      ;;
  esac
done

if [[ ! "$GROK_BOT_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[A-Za-z0-9.]+)?$ ]]; then
  die "GROK_BOT_VERSION must be X.Y.Z[-suffix], got: $GROK_BOT_VERSION"
fi

if [[ ! -f /etc/os-release ]]; then
  die "Grok Bot Linux package is Debian/Ubuntu-only (see agents/grok/bot.md)"
fi
# shellcheck disable=SC1091
. /etc/os-release
os_id="${ID:-}"
os_id_like="${ID_LIKE:-}"
debian_like=0
case "$os_id" in
  debian|ubuntu) debian_like=1 ;;
esac
case " $os_id_like " in
  *" debian "*|*" ubuntu "*) debian_like=1 ;;
esac
if [[ "$debian_like" -ne 1 ]] || ! command -v apt >/dev/null 2>&1 || ! command -v dpkg >/dev/null 2>&1; then
  die "Grok Bot Linux package is Debian/Ubuntu-only (see agents/grok/bot.md)"
fi

arch="$(dpkg --print-architecture)"
case "$arch" in
  amd64|arm64) ;;
  *)
    die "unsupported architecture: ${arch} (need amd64 or arm64; see agents/grok/bot.md)"
    ;;
esac

if [[ "${EUID}" -eq 0 ]]; then
  SUDO=()
else
  if ! command -v sudo >/dev/null 2>&1; then
    die "sudo is required when not running as root"
  fi
  SUDO=(sudo)
fi

if [[ "$USE_DEB" -eq 1 ]]; then
  if ! command -v wget >/dev/null 2>&1; then
    die "wget is required for --deb"
  fi
  if ! command -v sha256sum >/dev/null 2>&1; then
    die "sha256sum is required for --deb"
  fi
else
  if ! command -v curl >/dev/null 2>&1; then
    die "curl is required for the APT method"
  fi
  if ! command -v gpg >/dev/null 2>&1; then
    die "gpg is required for the APT method"
  fi
fi

if dpkg-query -W grok-bot >/dev/null 2>&1; then
  echo "already installed; reinstalling/upgrading: $(dpkg-query -W grok-bot)"
fi

verify_sha256() {
  local expected="$1"
  local file="$2"
  printf '%s  %s\n' "$expected" "$file" | sha256sum -c -
}

sha256_from_packages() {
  local packages_file="$1"
  awk -v ver="$GROK_BOT_VERSION" -v pkgarch="$arch" '
    BEGIN { RS = ""; FS = "\n" }
    {
      pkg = ver_f = arch_f = sha = ""
      for (i = 1; i <= NF; i++) {
        if ($i ~ /^Package: /) { pkg = substr($i, 10) }
        else if ($i ~ /^Version: /) { ver_f = substr($i, 10) }
        else if ($i ~ /^Architecture: /) { arch_f = substr($i, 15) }
        else if ($i ~ /^SHA256: /) { sha = substr($i, 9) }
      }
      if (pkg == "grok-bot" && ver_f == ver && arch_f == pkgarch && sha != "") {
        print sha
        exit
      }
    }
  ' "$packages_file"
}

if [[ "$USE_DEB" -eq 1 ]]; then
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  url="${REPO_URL}/pool/${SUITE}/g/gr/grok-bot_${GROK_BOT_VERSION}_${arch}.deb"
  echo "Downloading ${url} ..."
  wget -qO "${tmp}/grok-bot.deb" "$url"

  if [[ "$GROK_BOT_VERSION" == "$PINNED_VERSION" ]]; then
    expected=""
    case "$arch" in
      amd64) expected="$SHA256_AMD64" ;;
      arm64) expected="$SHA256_ARM64" ;;
    esac
    verify_sha256 "$expected" "${tmp}/grok-bot.deb"
  else
    packages_url="${REPO_URL}/dists/${SUITE}/main/binary-${arch}/Packages"
    echo "Fetching Packages index ${packages_url} ..."
    if wget -qO "${tmp}/Packages" "$packages_url"; then
      expected="$(sha256_from_packages "${tmp}/Packages")"
      if [[ -n "$expected" ]]; then
        verify_sha256 "$expected" "${tmp}/grok-bot.deb"
      else
        echo "WARNING: SHA256 for grok-bot ${GROK_BOT_VERSION} (${arch}) not found in Packages index; checksum unverifiable, continuing" >&2
      fi
    else
      echo "WARNING: could not fetch Packages index at ${packages_url}; SHA256 unverifiable for grok-bot ${GROK_BOT_VERSION}, continuing" >&2
    fi
  fi

  "${SUDO[@]}" dpkg -i "${tmp}/grok-bot.deb"
  "${SUDO[@]}" apt-get install -f -y
else
  echo "Installing APT keyring and grok-bot suite ..."
  "${SUDO[@]}" install -d -m 0755 /etc/apt/keyrings
  curl -fsSL "$KEY_URL" | gpg --dearmor | "${SUDO[@]}" tee "$KEYRING" >/dev/null
  echo "deb [arch=amd64,arm64 signed-by=${KEYRING}] ${REPO_URL} ${SUITE} main" \
    | "${SUDO[@]}" tee "$LIST_FILE" >/dev/null
  "${SUDO[@]}" apt update
  "${SUDO[@]}" apt install -y grok-bot
fi

if ! dpkg-query -W grok-bot; then
  die "grok-bot package not found after install (dpkg-query -W grok-bot failed)"
fi
if ! command -v grok-bot >/dev/null 2>&1; then
  die "grok-bot launcher not found on PATH after install"
fi

echo "Install complete. Grok Bot needs an eligible paid plan (SuperGrok Plus/Heavy, Cursor Pro+/Ultra, Cursor Teams Standard/Premium), a Cursor account, and a graphical session (see agents/grok/bot.md). Headless users: use the Grok Build CLI instead (agents/grok/cli.md)."
