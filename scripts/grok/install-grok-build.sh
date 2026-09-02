#!/usr/bin/env bash
# Mirrors agents/grok/cli.md — Install.
set -euo pipefail

INSTALLER_URL="https://x.ai/cli/install.sh"

usage() {
  cat <<'EOF'
Usage: install-grok-build.sh [--help] [VERSION]

Install Grok Build CLI via the official installer (https://x.ai/cli/install.sh),
fix PATH for the current process, and verify grok --version.

  --help     Show this help and exit
  VERSION    Optional installer version (X.Y.Z[-suffix]), forwarded as a
             positional argument to the official installer

Environment (passed through to the installer, untouched):
  GROK_BIN_DIR      Install location (default: ~/.grok/bin)
  GROK_CHANNEL      stable | alpha | enterprise
  GROK_PROXY_URL    Proxy URL for the installer download

This script does not run grok login and does not handle credentials.
See agents/grok/cli.md.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

VERSION=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      die "unknown option: $1 (see --help)"
      ;;
    *)
      if [[ -n "$VERSION" ]]; then
        die "unexpected argument: $1 (see --help)"
      fi
      if [[ ! "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[A-Za-z0-9.]+)?$ ]]; then
        die "VERSION must be X.Y.Z[-suffix], got: $1"
      fi
      VERSION="$1"
      shift
      ;;
  esac
done

os="$(uname -s)"
case "$os" in
  Linux|Darwin|MINGW*|MSYS*) ;;
  *)
    die "unsupported OS; see agents/grok/cli.md"
    ;;
esac

if ! command -v curl >/dev/null 2>&1; then
  die "curl is required (install with: apt install curl  OR  dnf install curl)"
fi

if command -v grok >/dev/null 2>&1; then
  echo "already installed, upgrading/reinstalling: $(grok --version)"
fi

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

echo "Downloading ${INSTALLER_URL} ..."
curl -fsSL "$INSTALLER_URL" -o "$tmp"

echo "Running official installer${VERSION:+ (version $VERSION)} ..."
bash "$tmp" ${VERSION:+"$VERSION"}

export PATH="${GROK_BIN_DIR:-$HOME/.grok/bin}:$PATH"

if command -v grok >/dev/null 2>&1; then
  grok --version
elif [[ -x "${GROK_BIN_DIR:-$HOME/.grok/bin}/grok" ]]; then
  "${GROK_BIN_DIR:-$HOME/.grok/bin}/grok" --version
else
  die 'grok not found after install — restart the terminal or `export PATH="$HOME/.grok/bin:$PATH"` (see agents/grok/cli.md)'
fi

echo "Install complete. Next: grok login (see agents/grok/cli.md). This script does not run it."
