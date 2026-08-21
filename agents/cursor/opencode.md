# Cursor via OpenCode

Cursor models inside OpenCode, through your Cursor login. Community plugin, not Cursor.

Path used here: [`@rama_nigg/open-cursor`](https://www.npmjs.com/package/@rama_nigg/open-cursor) ([docs](https://nomadcxx.github.io/opencode-cursor/docs/getting-started/installation/), [repo](https://github.com/Nomadcxx/opencode-cursor)). Other OpenCode↔Cursor bridges exist. This page is this plugin.

You need OpenCode, a Cursor login, and `cursor-agent` on PATH. See [CLI](cli.md).

```shell
opencode --version
cursor-agent --version
```

## Install

```shell
npm install -g @rama_nigg/open-cursor
open-cursor install
```

That writes the `cursor-acp` provider into `~/.config/opencode/opencode.json`, installs the plugin, and reads models from `cursor-agent`. It backs up the existing config unless you pass `--no-backup`. It leaves `.cursor` alone unless you pass `--install-cursor-bridge`.

```shell
cursor-agent login
cursor-agent models
opencode models | grep cursor-acp
```

The last command should list `cursor-acp/auto`. If it prints nothing: login again, then `open-cursor install` and `open-cursor sync-models`. The desktop model list and the CLI model list are not the same.

Quota errors come from Cursor. Diagnose with `open-cursor doctor --deep`.

Do not put API keys in this repo.

## What it does

OpenCode speaks OpenAI-compatible HTTP. `cursor-agent` speaks a process/stream protocol. The plugin runs a local proxy:

```
OpenCode  →  http://127.0.0.1:32124/v1  →  cursor-agent  →  Cursor API
```

32124 is the default. If something else owns the port, stop it or pass `--base-url` to `open-cursor install`.

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

```shell
open-cursor sync-models
```

```shell
npm update -g @rama_nigg/open-cursor
```

Restart OpenCode after an upgrade. The running plugin does not replace itself.

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
