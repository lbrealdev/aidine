# Grok Build

Grok Build is the `grok` CLI.

Sources: [x.ai/cli](https://x.ai/cli), [xai-org/grok-build](https://github.com/xai-org/grok-build), [docs.x.ai/build](https://docs.x.ai/build/overview).

## Install

Auxiliary script: [scripts/grok/install-grok-build.sh](../../scripts/grok/install-grok-build.sh) runs the installer below and verifies `grok --version`.

Linux, macOS, Git Bash:

```shell
curl -fsSL https://x.ai/cli/install.sh | bash
grok --version
```

That is the official installer. Read `https://x.ai/cli/install.sh` first if you want to see the script.

The compiled artifact is named `xai-grok-pager`; official installs ship it as `grok`. Prebuilt binaries for Linux (also macOS and Windows). Verify with `grok --version` after install — some systems already have an unrelated `grok`.

The script installs `~/.grok/bin/grok` (and `~/.grok/bin/agent`, same binary) and adds `~/.grok/bin` to PATH in the shell rc file. Override the bin dir with `GROK_BIN_DIR`. If the shell says `command not found`, restart the terminal or:

```shell
export PATH="$HOME/.grok/bin:$PATH"
```

Building from source is out of scope; see the [repo README](https://github.com/xai-org/grok-build).

Windows (out of scope): `irm https://x.ai/cli/install.ps1 | iex`.

## Auth and check

```shell
grok --version
grok            # first launch opens a browser to sign in
grok login      # re-authenticate / switch account
grok logout     # clear cached session
```

Headless (SSH, containers, no browser):

```shell
grok login --device-auth    # alias: --device-code
```

prints a URL + code; complete on any device.

API-key fallback for CI/automation:

```shell
export XAI_API_KEY="xai-..."   # key from https://console.x.ai
grok
```

Active session token (`~/.grok/auth.json`, mode 0600) wins over `XAI_API_KEY`. `grok logout` (or deleting `~/.grok/auth.json`) restores the key fallback. `~/.grok/auth.json` and `~/.grok/mcp_credentials.json` are bearer credentials — never commit them.

## Use

```shell
grok
grok -p "Explain this codebase"                              # headless
grok -p "Explain the architecture" --output-format streaming-json
```

Config: `~/.grok/config.toml`.
