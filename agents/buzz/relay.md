# Buzz relay

Primary self-host path is from source. Needs Docker and [Hermit](https://cashapp.github.io/hermit/) (or Rust 1.88+, Node 24+, pnpm 10+, `just`).

Source: [block/buzz](https://github.com/block/buzz) README, Quick start.

```shell
git clone https://github.com/block/buzz.git && cd buzz
. ./bin/activate-hermit
just setup && just build
just dev
```

`just dev` starts the relay and the desktop app. Relay on `ws://localhost:3000`.

VPS: production Compose bundle in [`deploy/compose/`](https://github.com/block/buzz/tree/main/deploy/compose).

Hosted: [Deploy on Railway](https://railway.com/deploy/buzz-relay-block). Write-up: [Run your own Buzz relay](https://engineering.block.xyz/blog/run-your-own-buzz-relay).
