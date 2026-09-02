# Grok

xAI has two agent surfaces. Both install on Linux: Grok Build (the `grok` CLI) and Grok Bot (the desktop agent, shipped as a `.deb`).

Sources: [x.ai/cli](https://x.ai/cli), [xai-org/grok-build](https://github.com/xai-org/grok-build), [docs.x.ai/build](https://docs.x.ai/build/overview), [x.ai/bot](https://x.ai/bot), [Grok Bot get started](https://docs.x.ai/grok-bot/get-started), [aptrepo](https://downloads.cursor.com/aptrepo).

## Install

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

## Grok Bot

[Grok Bot](https://x.ai/bot) is a separate product — desktop agent. Official Linux build is package `grok-bot` (v0.30.0, amd64 and arm64) from Cursor's signed apt repo (`https://downloads.cursor.com/aptrepo`, suite `grok-bot`). Vendor `SpaceXAI <hi@cursor.com>`. Previously named `sand` (renamed in v0.19.0; still `Provides`/`Conflicts`/`Replaces: sand`). App under `/opt/Grok Bot/`, launcher `grok-bot`, `.desktop` file, icons.

Needs an eligible paid plan (SuperGrok Plus/Heavy, Cursor Pro+/Ultra, Cursor Teams Standard/Premium) and a Cursor account. Graphical environment expected; the CLI above is the headless option. Product page download is OS-detect: Linux gets the `.deb`.

### APT (Debian / Ubuntu)

Same GPG key as [Cursor desktop](../cursor/desktop.md). Suite is `grok-bot`, not `stable`.

```shell
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo grok-bot main" \
  | sudo tee /etc/apt/sources.list.d/grok-bot.list > /dev/null

sudo apt update
sudo apt install grok-bot
```

### Direct `.deb`

```shell
wget https://downloads.cursor.com/aptrepo/pool/grok-bot/g/gr/grok-bot_0.30.0_amd64.deb \
  -qO grok-bot_0.30.0_amd64.deb

sha256sum grok-bot_0.30.0_amd64.deb
# fb888b2204c8a51c71a9f5f9a2913ac10561f3ef6939c1245ecae4e837d4ada2  (~103 MB)

sudo dpkg -i grok-bot_0.30.0_amd64.deb
sudo apt-get install -f
```

ARM64: `grok-bot_0.30.0_arm64.deb` in the same pool path.
