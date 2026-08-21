# Cursor via OpenCode

Run Cursor subscription models inside OpenCode. Not an official Cursor product.

Path used here: [`@rama_nigg/open-cursor`](https://www.npmjs.com/package/@rama_nigg/open-cursor) ([docs](https://nomadcxx.github.io/opencode-cursor/docs/getting-started/installation/), [repo](https://github.com/Nomadcxx/opencode-cursor)).

You need OpenCode, a Cursor login, and `cursor-agent` on `PATH`. See [CLI](cli.md).

```shell
opencode --version
cursor-agent --version
```

## Install

```shell
npm install -g @rama_nigg/open-cursor
open-cursor install
```

That writes the `cursor-acp` provider into `~/.config/opencode/opencode.json`, installs the plugin, and discovers models from `cursor-agent`. It backs up the existing config unless you pass `--no-backup`. It does not touch `.cursor` unless you ask (`--install-cursor-bridge`).

Auth is owned by the CLI:

```shell
cursor-agent login
cursor-agent models
opencode models | grep cursor-acp
```

The last command should at least list `cursor-acp/auto`.

## What it does

OpenCode talks OpenAI-compatible HTTP. `cursor-agent` talks a process/stream protocol. The plugin starts a local proxy that translates:

```
OpenCode  →  http://127.0.0.1:32124/v1  →  cursor-agent  →  Cursor API
```

Check the proxy:

```shell
lsof -i :32124
curl -s http://127.0.0.1:32124/v1/models
```

## Use

```shell
opencode run "Summarise this repository in five bullets." \
  --model cursor-acp/auto
```

Or start `opencode` and pick a `cursor-acp/*` model.

Refresh the model list after Cursor changes what the account can see:

```shell
open-cursor sync-models
```

Upgrade:

```shell
npm update -g @rama_nigg/open-cursor
```

Then restart OpenCode. The running plugin does not replace itself.

## Manual config (if you skip the installer)

```json
{
  "plugin": ["@rama_nigg/open-cursor@latest"],
  "provider": {
    "cursor-acp": {
      "name": "Cursor ACP",
      "npm": "@ai-sdk/openai-compatible",
      "options": {
        "baseURL": "http://127.0.0.1:32124/v1"
      },
      "models": {
        "cursor-acp/auto": {
          "name": "Auto"
        }
      }
    }
  }
}
```

## Traps

- Community plugin. Other OpenCode↔Cursor bridges exist (`opencode-cursor-auth`, OAuth plugins, etc.). They are not this page.
- Port **32124** is the default. If something else owns it, stop that process or pass `--base-url` to `open-cursor install`.
- `opencode models | grep cursor-acp` empty: `cursor-agent login`, then `open-cursor install` and `open-cursor sync-models`. Desktop model list ≠ CLI model list.
- Quota errors come from Cursor, not from the plugin.
- Diagnose with `open-cursor doctor --deep`.

Do not put API keys in this repo.
