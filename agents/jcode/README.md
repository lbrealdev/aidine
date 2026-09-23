# Jcode

Early notes. Not yet day-to-day here — install, surfaces, and upstream links.

Jcode is a Rust coding agent and harness (MIT). Same core binary for TUI, one-shot CLI, and server/client. Desktop is a separate native app on the Jcode SDK.

Pitch: RAM-efficient harness for many parallel sessions. Site [jcode.sh](https://jcode.sh), docs [jcode.sh/docs](https://jcode.sh/docs), core repo [1jehuang/jcode](https://github.com/1jehuang/jcode) (`master`).

| Surface | Binary | What it is |
|---|---|---|
| [Core](core.md) | `jcode` | TUI, `jcode run`, `serve` / `connect`. [docs](https://jcode.sh/docs) |
| [Desktop](desktop.md) | `jcode-desktop` | Native spatial client on the SDK. [download](https://jcode.sh/desktop) |

## Peers (one line)

- **Pi** — lighter terminal coding agent; Jcode aims at lower RAM for many parallel sessions.
- **OpenCode** — TypeScript harness ([opencode.ai](https://opencode.ai/)); also noted here under [OpenCode](../opencode/README.md).
- **Claude Code** — Anthropic's agent CLI; Jcode can resume Claude Code (and Codex / OpenCode / Pi) sessions.

## Links

- [Website](https://jcode.sh)
- [Docs](https://jcode.sh/docs)
- [Core repo](https://github.com/1jehuang/jcode)
- [Desktop repo](https://github.com/1jehuang/jcode-desktop)
- [SDK](https://jcode.sh/sdk)
- [Swarm](https://jcode.sh/swarm)
