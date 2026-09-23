# Jcode core (`jcode`)

Same binary: interactive TUI, one-shot CLI, and persistent server/client.

Sources: [jcode.sh/docs](https://jcode.sh/docs), [1jehuang/jcode](https://github.com/1jehuang/jcode) README.

Early notes — not dogfooded here yet.

## Install

macOS and Linux:

```shell
curl -fsSL https://jcode.sh/install | bash
```

Homebrew:

```shell
brew tap 1jehuang/jcode
brew install jcode
```

Windows 11 (PowerShell 5.1+):

```powershell
irm https://jcode.sh/install.ps1 | iex
```

From source:

```shell
git clone https://github.com/1jehuang/jcode.git
cd jcode
cargo build --release
scripts/install_release.sh
```

Termux: `pkg install glibc patchelf` before the install script.

Config defaults to `~/.jcode/config.toml`. Project instructions: `AGENTS.md` in the repo; machine-wide: `~/AGENTS.md`.

## First run

```shell
jcode login
jcode auth-test --all-configured
```

Built-in providers include Claude, OpenAI / ChatGPT / Codex, Gemini, Copilot, Azure, Ollama, LM Studio, and more. Headless: `jcode login --provider <name> --no-browser`.

## TUI

```shell
jcode
```

Interactive session. Type `/` for slash commands; `/help` lists them. Common ones: `/model`, `/login`, `/account`, `/resume`, `/swarm`, `/update`, `/quit`.

Resume by memorable name:

```shell
jcode --resume fox
```

## CLI one-shot

```shell
jcode run "say hello"
```

Non-interactive prompt. Useful for smoke tests after install.

## Server / client

Daemon owns sessions, tools, and provider calls; the TUI is a client on a socket.

```shell
jcode serve
jcode connect
```

`serve` keeps a persistent background server; `connect` attaches another client. Remote patterns (SSH, socket forwarding, gateway pair) are in the [docs](https://jcode.sh/docs).

## Also brief

| Command | Role |
|---|---|
| `jcode update` | Pull latest stable (or `/update` in the TUI; restart client after CLI update) |
| `jcode dictate` | Voice input via a configured STT command (no bundled STT stack) |
| Swarm | Multi-agent in one repo; server-managed collab. Toggle `/swarm`. See [jcode.sh/swarm](https://jcode.sh/swarm) |

Uninstall binaries (keeps config/sessions unless `--purge`):

```shell
curl -fsSL https://raw.githubusercontent.com/1jehuang/jcode/master/scripts/uninstall.sh | bash -s -- --yes
```
