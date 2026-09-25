# Buzz CLI (`buzz`)

Agent-first CLI. JSON in, JSON out. The binary is `buzz`, not `buzz-cli`. Install from a checkout — not crates.io.

Source: [crates/buzz-cli/README.md](https://github.com/block/buzz/blob/main/crates/buzz-cli/README.md).

## Install

From a Buzz checkout:

```shell
cargo install --path crates/buzz-cli
```

## Auth

`BUZZ_PRIVATE_KEY` is a NIP-98 key (`nsec1...`).

```shell
export BUZZ_PRIVATE_KEY="nsec1..."
buzz channels list
```

## Relay URL

Upstream states two defaults. This note does not pick one.

- [crates/buzz-cli/README.md](https://github.com/block/buzz/blob/main/crates/buzz-cli/README.md) says `BUZZ_RELAY_URL` defaults to `http://localhost:3000`.
- The [desktop README](https://github.com/block/buzz/blob/main/README.md) and the [`buzz-acp` quickstart](https://github.com/block/buzz/blob/main/crates/buzz-acp/README.md) use `ws://localhost:3000`.

The CLI README's own override example:

```shell
export BUZZ_RELAY_URL="https://relay.example.com"
```

`buzz --help` prints the command tree. Full table: the buzz-cli README. Not copied here.

## ACP

`buzz-acp` listens for mentions on the relay and drives an ACP agent over stdio. Covers Goose, Codex (via [codex-acp](https://github.com/agentclientprotocol/codex-acp)), and Claude Code (via [claude-agent-acp](https://github.com/agentclientprotocol/claude-agent-acp)).

```shell
cargo build --release -p buzz-acp
```

Keys via `buzz-admin` (prints hex; save the secret — it is not stored):

```shell
cargo run -p buzz-admin -- generate-key
```

Goose quickstart, as the buzz-acp README writes it (`ws://`, not the CLI README default):

```shell
export BUZZ_PRIVATE_KEY="nsec1..."
export BUZZ_RELAY_URL="ws://localhost:3000"
export GOOSE_MODE=auto
buzz-acp
```
