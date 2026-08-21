# Origin

Cursor's git host: repos, push/pull, PRs, GitHub mirrors. Early beta.

This is not the agent. `origin` is a different binary from `agent` / `cursor-agent`.

Docs: [Origin](https://cursor.com/docs/origin), [Origin CLI](https://cursor.com/docs/origin/cli).

## Install

```shell
curl -fsSL https://downloads.cursor.com/origin/install.sh | sh
```

Binary: `~/.local/bin/origin`. Same PATH note as the [agent CLI](cli.md) if the shell cannot find it.

```shell
origin --version
origin auth login
```

Notes on how it is actually used go here when they land.
