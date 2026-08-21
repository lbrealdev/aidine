# Cursor desktop

The local agent, with an IDE attached.

Linux notes below. macOS and Windows: [cursor.com/download](https://cursor.com/download).

This package is `cursor`. It is not the [CLI](cli.md) (`agent` / `cursor-agent`).

## What you actually open

| Surface | Role |
|---|---|
| Agents Window | Agent UI. Parallel agents, local / cloud / SSH. [docs](https://cursor.com/docs/agent/agents-window) |
| IDE | Files, extensions, splits. Command palette → Open IDE |
| Tab | Inline completions in the editor. Not the agent loop. You only see it in the IDE. [help](https://cursor.com/help/ai-features/tab) |

You can keep Agents Window and the IDE open together. From the IDE, command palette → Open Agents Window.

Agent (Ctrl-I / Cmd-I in the editor, or the Agents Window) is the tool loop: search, edit, shell. Tab is the next-edit guess while you type.

## Linux

Current release is 3.17. APT follows that. A one-off `.deb` works too.

### APT (Debian / Ubuntu)

From [Cursor's quickstart](https://cursor.com/docs/get-started/quickstart):

```shell
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null

sudo apt update
sudo apt install cursor
```

RHEL / Fedora: `https://downloads.cursor.com/yumrepo`, same page.

### Direct `.deb`

```shell
wget https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.17 \
  -qO cursor_linux_amd64.deb

sudo dpkg -i cursor_linux_amd64.deb
sudo apt-get install -f
```

ARM64: `linux-arm64-deb` in the URL.

```shell
which cursor
dpkg-query -W cursor
cursor --version
```

### AppImage

From [cursor.com/download](https://cursor.com/download):

```shell
chmod +x Cursor-*.AppImage
./Cursor-*.AppImage
```

Portable. No menu icon, and no `cursor` on PATH unless you wrap it. Some Debian/Ubuntu setups need `libfuse2`.
