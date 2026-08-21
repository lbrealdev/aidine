# Cursor CLI (`agent` / `cursor-agent`)

The same agent as desktop, in the terminal. Separate install.

Sources: [cursor.com/cli](https://cursor.com/cli), [install docs](https://cursor.com/docs/cli/installation).

## Install

macOS, Linux, WSL:

```shell
curl https://cursor.com/install -fsS | bash
```

That is the official installer. Read `https://cursor.com/install` first if you want to see the script.

Windows (native PowerShell):

```powershell
irm 'https://cursor.com/install?win32=true' | iex
```

The script puts a versioned bundle under `~/.local/share/cursor-agent/versions/` and creates:

```
~/.local/bin/agent
~/.local/bin/cursor-agent
```

Docs use `agent`. OpenCode plugins look for `cursor-agent`. Same binary.

If the shell says `command not found`, `~/.local/bin` is not on PATH:

```shell
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

zsh: same line in `~/.zshrc`.

You can run this on a machine that has no desktop app.

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

```shell
agent update
```

Auto-update is on by default.
