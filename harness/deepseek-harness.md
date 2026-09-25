# DeepSeek Harness

Open-source agent harness (`dsh`) from DeepSeek. Everything is a plugin, on Cordis. Developer preview; breaking changes are expected.

Upstream: [deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness).

## Cordis

[Cordis](https://github.com/cordiverse/cordis) is the runtime DeepSeek Harness builds on: plugins are the system, composed over time, not add-ons on a fixed core. The harness docs include a [Cordis primer](https://deepseek-harness.github.io/deepseek-harness/en/reference/cordis-primer).

## Install

`npx` needs Node.js. A local launch starts the Web UI at `http://127.0.0.1:3080` and opens a browser. `--no-open` skips the browser. An SSH launch prints the URL only.

```shell
npx @deepseek-ai/dsh web
```

From source:

```shell
git clone https://github.com/deepseek-ai/deepseek-harness.git
cd deepseek-harness
pnpm install
pnpm run build
pnpm dsh web
```

## Developer preview

[SAFETY.md](https://github.com/deepseek-ai/deepseek-harness/blob/master/SAFETY.md) says the project is not security-audited and is not production software. It can run model-generated commands and load third-party plugins. Prefer a disposable VM or container.

## Smoke check (disposable VM or container only)

Not a daily-driver step. Use a VM or container you can throw away.

1. Read [SAFETY.md](https://github.com/deepseek-ai/deepseek-harness/blob/master/SAFETY.md).
2. Run:

```shell
npx @deepseek-ai/dsh web
```

3. Expect the Web UI on port 3080.
4. Discard the VM or container.

## Links

- [Repo](https://github.com/deepseek-ai/deepseek-harness)
- [SAFETY.md](https://github.com/deepseek-ai/deepseek-harness/blob/master/SAFETY.md)
- [Docs (English)](https://deepseek-harness.github.io/deepseek-harness/en/)
- [Quickstart (English)](https://deepseek-harness.github.io/deepseek-harness/en/guide/quickstart)
