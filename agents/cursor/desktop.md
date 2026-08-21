# Cursor desktop

The local agent, with an IDE attached.

Linux notes below. macOS and Windows installers: [cursor.com/download](https://cursor.com/download).

This package is `cursor`. It is not the [CLI](cli.md) (`agent` / `cursor-agent`).

Checked 2026-08-21. Latest on the download page was 3.17.

## What you actually open

| Surface | Role |
|---|---|
| Agents Window | Agent UI. Parallel agents, local / cloud / SSH. [docs](https://cursor.com/docs/agent/agents-window) |
| IDE | Files, extensions, splits. Command palette → Open IDE |
| Tab | Inline completions in the editor. Not the agent loop. Cloud agents do not run Tab. [help](https://cursor.com/help/ai-features/tab) |

You can keep Agents Window and the IDE open together. From the IDE, command palette → Open Agents Window.

Agent (Ctrl-I / Cmd-I in the editor, or the Agents Window) is the tool loop: search, edit, shell. Tab is the next-edit guess while you type. Stay in Agents Window only and you will not see Tab.

## Pin a Linux `.deb` (golden track)

The update API gives the current patch on a minor track. `.../cursor/3.10` is not frozen at 3.10.17; it follows the latest 3.10.x.

```shell
# 3.10 track → currently cursor_3.10.20_amd64.deb
wget https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.10 \
  -qO cursor_linux_amd64.deb

# latest track (3.17 → currently cursor_3.17.8_amd64.deb)
wget https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.17 \
  -qO cursor_linux_amd64.deb

sudo dpkg -i cursor_linux_amd64.deb
sudo apt-get install -f
```

```shell
which cursor
dpkg-query -W cursor
cursor --version
```

ARM64: swap `linux-x64-deb` for `linux-arm64-deb`.

On first launch the package may add Cursor's APT repo. If `apt update` then fails on signatures, import the key used in the APT section below, or install from that repo instead of a one-off `.deb`.

## APT (Debian / Ubuntu)

From [Cursor's quickstart](https://cursor.com/docs/get-started/quickstart). Use this if you want desktop icons and `apt` upgrades.

```shell
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null

sudo apt update
sudo apt install cursor
```

RHEL / Fedora: `https://downloads.cursor.com/yumrepo`, same quickstart page.

## AppImage

From [cursor.com/download](https://cursor.com/download):

```shell
chmod +x Cursor-*.AppImage
./Cursor-*.AppImage
```

Portable. No menu icon, and no `cursor` on PATH unless you wrap it. Some Debian/Ubuntu setups need `libfuse2`.
