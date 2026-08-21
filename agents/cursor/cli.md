# Cursor CLI (`agent` / `cursor-agent`)

Terminal agent. Same account and models as the editor. Separate install from desktop.

Sources: [cursor.com/cli](https://cursor.com/cli), [install docs](https://cursor.com/docs/cli/installation).

## Install

macOS, Linux, WSL:

```shell
curl https://cursor.com/install -fsS | bash
```

Windows (native PowerShell):

```powershell
irm 'https://cursor.com/install?win32=true' | iex
```

The script drops a versioned bundle under `~/.local/share/cursor-agent/versions/` and symlinks:

```
~/.local/bin/agent
~/.local/bin/cursor-agent
```

Official docs use `agent`. Plugins (OpenCode) look for `cursor-agent`. Both names are the same binary.

If `command not found`:

```shell
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

zsh: same line in `~/.zshrc`.

## Auth and check

```shell
agent --version          # or: cursor-agent --version
agent login
agent status             # alias: whoami
agent models
```

For scripts, `CURSOR_API_KEY` / `--api-key` also work. See [headless CLI](https://cursor.com/docs/cli/headless).

## Use

```shell
agent
agent "explain this repo"
agent --mode=ask "what does the auth module do?"
agent --plan "add a health endpoint"
```

Print mode (scripts, no TUI):

```shell
agent -p "what does this codebase do?"
agent -p --force "add JSDoc to src/app.ts"
agent -p --output-format json "review the last commit"
```

Without `--force`, print mode proposes and does not write.

Update:

```shell
agent update
```

Auto-update is on by default.

## Traps

- Desktop install ≠ CLI. You can run `cursor-agent` on a machine with no editor.
- `origin` is not this CLI. Origin is Cursor's git host (`curl -fsSL https://downloads.cursor.com/origin/install.sh | sh`).
- Piping `curl | bash` is the official path. Read `https://cursor.com/install` first if you want to see what it does.
- `~/.local/bin` missing from `PATH` is the usual "installed but not found".
