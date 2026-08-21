# Cursor

Cursor is an agent. Desktop, CLI, and cloud are places it runs — not three different products.

Desktop is **agent-first**. The IDE is there when you want files, extensions, and Tab (inline completions). Official line: an agent-first experience, with the editor for when you need it.

| Surface | Binary | What it is |
|---|---|---|
| [Desktop](desktop.md) | `cursor` | Agent on the machine. IDE + Tab optional. [cursor.com/download](https://cursor.com/download) |
| [CLI](cli.md) | `agent` / `cursor-agent` | Same agent in the terminal. [cursor.com/cli](https://cursor.com/cli) |
| [OpenCode](opencode.md) | `opencode` + local proxy | Cursor models inside OpenCode, via `cursor-agent` |

They do not install each other. Desktop `.deb` / APT does not give you `cursor-agent`.

Official docs call the CLI `agent`. The installer also drops a `cursor-agent` symlink. Use that name with OpenCode plugins.

`origin` is a different CLI (Cursor's code host). It is not the agent. See [Origin CLI](https://cursor.com/docs/origin/cli).

## Links

- [Download](https://cursor.com/download)
- [Agents Window](https://cursor.com/docs/agent/agents-window)
- [Agent overview](https://cursor.com/docs/agent/overview)
- [CLI](https://cursor.com/cli)
- [CLI install](https://cursor.com/docs/cli/installation)
- [Linux desktop (quickstart)](https://cursor.com/docs/get-started/quickstart)
