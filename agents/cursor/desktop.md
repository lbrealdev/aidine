# Cursor desktop

The graphical editor. Linux notes below; macOS and Windows installers live on [cursor.com/download](https://cursor.com/download).

Desktop is not the agent CLI. Installing `.deb` / APT does not give you `cursor-agent`.

Checked 2026-08-21. Latest on the download page was **3.17**.

## Pin a Linux `.deb` (golden track)

Cursor's update API serves the current patch on a minor track. The `3.10` URL does not freeze `3.10.17`; it follows the latest 3.10.x.

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

Verify:

```shell
which cursor
dpkg-query -W cursor
cursor --version
```

ARM64: swap `linux-x64-deb` for `linux-arm64-deb`.

On first launch the package may add Cursor's APT repo so later upgrades go through `apt`. If `apt update` then fails on signatures, import the key (see below) or use the official repo install instead of a one-off `.deb`.

## APT (Debian / Ubuntu)

From [Cursor's quickstart](https://cursor.com/docs/get-started/quickstart). Preferred if you want desktop icons and package updates.

```shell
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null

sudo apt update
sudo apt install cursor
```

RHEL / Fedora: `https://downloads.cursor.com/yumrepo` — same quickstart page.

## AppImage

From [cursor.com/download](https://cursor.com/download) (or [cursor.com/downloads](https://cursor.com/downloads)):

```shell
chmod +x Cursor-*.AppImage
./Cursor-*.AppImage
```

Portable. No desktop integration, no `cursor` on `PATH` unless you wrap it. Needs FUSE on some distros (`libfuse2` on Debian/Ubuntu).

## Traps

- Pinning `3.10` is a **minor track**, not a file. Re-run wget and you may get a newer 3.10.x.
- A `.deb` install can register an APT source that then breaks `apt update` if the GPG key is missing. Import `https://downloads.cursor.com/keys/anysphere.asc` or switch to the official repo commands above.
- AppImage is the fallback, not the Linux default anymore.
