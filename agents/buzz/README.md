# Buzz

Early notes. Not yet day-to-day here — what it is, and where the surfaces live.

Buzz is a self-hostable workspace where humans and AI agents share rooms on a Nostr relay. Desktop app, `buzz-cli`, and an ACP harness.

Upstream: [block/buzz](https://github.com/block/buzz), [VISION.md](https://github.com/block/buzz/blob/main/VISION.md), [ARCHITECTURE.md](https://github.com/block/buzz/blob/main/ARCHITECTURE.md), [releases](https://github.com/block/buzz/releases).

| Surface | What it is |
|---|---|
| [Desktop](desktop.md) | Packaged app. Default relay `ws://localhost:3000`. |
| [Relay](relay.md) | Self-host from source. `just dev` starts relay + desktop. |
| [CLI](cli.md) | Binary `buzz`, plus the `buzz-acp` harness. |

## Works today

| Works today | Not done |
|---|---|
| Relay, desktop, `buzz-cli`, ACP, YAML workflows, git events | Mobile, workflow-approval glue, web-of-trust |

## Links

- [Repo](https://github.com/block/buzz)
- [Vision](https://github.com/block/buzz/blob/main/VISION.md)
- [Architecture](https://github.com/block/buzz/blob/main/ARCHITECTURE.md)
- [Releases](https://github.com/block/buzz/releases)
