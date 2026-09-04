# Grok Bot

Sources: [x.ai/bot](https://x.ai/bot), [Grok Bot get started](https://docs.x.ai/grok-bot/get-started), [aptrepo](https://downloads.cursor.com/aptrepo).

[Grok Bot](https://x.ai/bot) is a separate product — desktop agent. Official Linux build is package `grok-bot` (v0.30.0, amd64 and arm64) from Cursor's signed apt repo (`https://downloads.cursor.com/aptrepo`, suite `grok-bot`). Vendor `SpaceXAI <hi@cursor.com>`. Previously named `sand` (renamed in v0.19.0; still `Provides`/`Conflicts`/`Replaces: sand`). App under `/opt/Grok Bot/`, launcher `grok-bot`, `.desktop` file, icons.

Needs an eligible paid plan (SuperGrok Plus/Heavy, Cursor Pro+/Ultra, Cursor Teams Standard/Premium) and a Cursor account. Graphical environment expected; the CLI above is the headless option. Product page download is OS-detect: Linux gets the `.deb`.

Auxiliary script: [scripts/install-grok-bot.sh](../../scripts/install-grok-bot.sh) automates both methods below (APT by default, `--deb` for the direct download).

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
