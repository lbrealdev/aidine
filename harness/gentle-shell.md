# Gentle Shell

Pi-native workspace UI: changes, agents, status, diffs. Related to [Gentle-AI](gentle-ai.md) but Pi-specific — not a general multi-agent installer.

Product name: `gentle-shell`. npm package and repo are still `gentle-pi` during the naming transition.

Upstream: [Gentleman-Programming/gentle-shell](https://github.com/Gentleman-Programming/gentle-shell).

## When it matters

Use it if you run **Pi** and want a focused workspace (live changes, subagent cards, status) instead of a bare terminal session.

Skip it if you are not on Pi — configure other agents with Gentle-AI alone. There is no separate Pi note under `agents/` yet.

## Install / launcher

Standalone launcher (recommended; does not modify your Pi agent install):

```shell
npm i -g gentle-pi

gentle-shell          # own home: ~/.gentle-shell/agent
gentle-shell --link   # reuse ~/.pi/agent (sign-ins, models, chats)
```

First launch provisions the isolated home. Re-run setup by hand:

```shell
gentle-shell setup
```

Make `--link` the default:

```shell
gentle-shell home link
```

Extra args forward to Pi (`gentle-shell --mode rpc`, `gentle-shell -p "..."`, …).

### Inside an existing Pi

```shell
pi install npm:gentle-pi@3.5.1
# restart Pi, then:
gentle-ai sync
pi
```

In-session checks: `/gentle:status`, `/gentle:doctor`.

## Relation to Gentle-AI

Gentle-AI is the shared harness across many agents. Gentle Shell is how that story lands for Pi: workspace layout plus companion packages. Memory is not bundled with `gentle-pi`; Engram and broader config come from Gentle-AI when you use that path.

## Links

- [Repo](https://github.com/Gentleman-Programming/gentle-shell)
- [gentle-shell reference](https://github.com/Gentleman-Programming/gentle-shell/blob/main/docs/gentle-shell.md)
- [Install / launcher](https://github.com/Gentleman-Programming/gentle-shell/blob/main/docs/readme-reference.md)
- [Gentle-AI](gentle-ai.md)
