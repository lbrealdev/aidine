# Scripts

Executable, auxiliary installers that automate, end-to-end, the installation steps documented in the [agents](../agents/README.md) notes.

The markdown notes remain the source of truth. These scripts automate them and stay linked from the notes.

## Layout

Organized by agent (subdirectory per agent). Currently [scripts/grok/](grok/). The same layout scales to other agents later (e.g. `scripts/cursor/`).

## Grok

### [scripts/grok/install-grok-build.sh](grok/install-grok-build.sh)

Install Grok Build CLI via the official installer, fix PATH for the current process, and verify `grok --version`.

```shell
install-grok-build.sh [--help] [VERSION]
```

Installs the `grok` CLI (Grok Build) from `https://x.ai/cli/install.sh`. Default bin dir: `~/.grok/bin`. Optional `VERSION` (`X.Y.Z[-suffix]`) is forwarded to the official installer. Does not run `grok login` and does not handle credentials.

`--help` prints usage and exits.

Docs: [agents/grok/cli.md](../agents/grok/cli.md).

### [scripts/grok/install-grok-bot.sh](grok/install-grok-bot.sh)

Install Grok Bot (desktop agent) on Debian/Ubuntu, amd64 or arm64.

```shell
install-grok-bot.sh [--help] [--deb]
```

Installs the `grok-bot` package. Default is the APT repo method; `--deb` downloads the `.deb` and verifies SHA256. Needs an eligible paid plan, a Cursor account, and a graphical session. Headless machines should use the Grok Build CLI instead.

`--help` prints usage and exits.

Docs: [agents/grok/bot.md](../agents/grok/bot.md).

## Conventions

Each script:

- bash (`#!/usr/bin/env bash`, `set -euo pipefail`)
- executable mode
- `--help`
- no committed credentials
- sudo only where needed
- idempotent-ish — reinstall/upgrade safe

Source of truth for what they automate: [agents/grok/cli.md](../agents/grok/cli.md), [agents/grok/bot.md](../agents/grok/bot.md).
