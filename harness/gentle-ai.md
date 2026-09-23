# Gentle-AI

Configures agents you already use: Engram memory, ODD everyday workflow, optional SDD, RDD review (on by default, opt-out). Does not install agents.

Upstream: [Gentleman-Programming/gentle-ai](https://github.com/Gentleman-Programming/gentle-ai).

## Install

macOS (Homebrew):

```shell
brew install gentleman-programming/tap/gentle-ai
```

macOS / Linux (curl):

```shell
curl -fsSL https://raw.githubusercontent.com/Gentleman-Programming/gentle-ai/main/scripts/install.sh | bash
```

Go (source; needs Go 1.25.10+):

```shell
go install github.com/gentleman-programming/gentle-ai/v3/cmd/gentle-ai@latest
```

Then:

```shell
gentle-ai          # pick agents, components, persona
gentle-ai doctor   # read-only health check
```

Configs are snapshotted before every write. Beta channel and per-distro notes: upstream [Quickstart](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/quickstart.md).

## Everyday use (ODD)

Organic Driven Development keeps small understood changes lightweight. The agent explores before editing, checks results, and keeps progress recoverable. Formal SDD phases are an explicit choice, not the default path.

Use your agent as usual after `gentle-ai` has configured it.

## Engram and RDD

- **Engram** — project memory so context accumulates across sessions instead of resetting.
- **RDD** — receipt-driven review, on by default. Opt out with `gentle-ai review mode disable`. Review freezes a candidate; commit/push stay yours.

## Agents in this repo

Gentle-AI integrates many agents. Among AIDINE notes it touches at least:

- [Hermes](../agents/hermes/README.md)
- [Cursor](../agents/cursor/README.md)
- [OpenCode](../agents/opencode/README.md)
- [Claude Code](../agents/claude-code/README.md)

Also Pi (see [Gentle Shell](gentle-shell.md)), Codex, and others — full matrix in upstream [agents docs](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/agents.md).

## Links

- [Repo](https://github.com/Gentleman-Programming/gentle-ai)
- [Intended usage](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/intended-usage.md)
- [Usage / ODD](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/usage.md)
- [Engram](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/engram.md)
- [Review / RDD](https://github.com/Gentleman-Programming/gentle-ai/blob/main/docs/review-integration.md)
