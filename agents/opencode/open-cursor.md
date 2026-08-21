# open-cursor

OpenCode plugin. Package: [`@rama_nigg/open-cursor`](https://www.npmjs.com/package/@rama_nigg/open-cursor).

It is a bridge: OpenCode talks to a local HTTP proxy, the proxy runs `cursor-agent`, Cursor's API answers.

```
OpenCode  →  http://127.0.0.1:32124/v1  →  cursor-agent  →  Cursor API
```

You need OpenCode, a Cursor login, and `cursor-agent` on PATH. CLI install: [Cursor CLI](../cursor/cli.md).

Docs: [opencode-cursor](https://nomadcxx.github.io/opencode-cursor/docs/). Repo: [Nomadcxx/opencode-cursor](https://github.com/Nomadcxx/opencode-cursor).

## Install

```shell
opencode --version
cursor-agent --version

npm install -g @rama_nigg/open-cursor
open-cursor install
```

That writes the `cursor-acp` provider into `~/.config/opencode/opencode.json` and reads models from `cursor-agent`. It backs up the existing config unless you pass `--no-backup`.

```shell
cursor-agent login
cursor-agent models
opencode models | grep cursor-acp
```

Expect `cursor-acp/auto`. If grep prints nothing: login again, then `open-cursor install` and `open-cursor sync-models`.

```shell
lsof -i :32124
curl -s http://127.0.0.1:32124/v1/models
```

32124 is the default. If the port is taken, stop that process or pass `--base-url` to `open-cursor install`.

Quota errors come from Cursor. `open-cursor doctor --deep` for the plugin.

Do not put API keys in this repo.

## Use

```shell
opencode run "Summarise this repository in five bullets." \
  --model cursor-acp/auto
```

Or start `opencode` and pick a `cursor-acp/*` model.

```shell
open-cursor sync-models
npm update -g @rama_nigg/open-cursor
```

Restart OpenCode after an upgrade.

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
