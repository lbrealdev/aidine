# Cursor

Cursor is an agent. Desktop, CLI, and cloud are where it runs.

Desktop is agent-first. Open the IDE when you want files, extensions, and Tab.

| Surface | Binary | What it is |
|---|---|---|
| [Desktop](desktop.md) | `cursor` | Agent on the machine. IDE and Tab if you want them. [cursor.com/download](https://cursor.com/download) |
| [CLI](cli.md) | `agent` / `cursor-agent` | Same agent in the terminal. [cursor.com/cli](https://cursor.com/cli) |
| [OpenCode](opencode.md) | `opencode` + local proxy | Cursor models inside OpenCode, via `cursor-agent` |

A desktop install does not put `cursor-agent` on your PATH. Install the CLI separately.

Docs call the CLI `agent`. The installer also creates a `cursor-agent` symlink. OpenCode plugins look for that name. Same binary.

## Also

- [Origin](origin.md) — Cursor's git host. Different binary from the agent.

## Links

- [Download](https://cursor.com/download)
- [Agents Window](https://cursor.com/docs/agent/agents-window)
- [Agent overview](https://cursor.com/docs/agent/overview)
- [CLI](https://cursor.com/cli)
- [CLI install](https://cursor.com/docs/cli/installation)
- [Linux desktop (quickstart)](https://cursor.com/docs/get-started/quickstart)
