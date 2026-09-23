# Jcode Desktop (`jcode-desktop`)

Native spatial desktop client for Jcode. Built on the [Jcode SDK](https://jcode.sh/sdk). Not an Electron wrapper around the TUI — sessions are panels on a spatial workspace.

Separate repo: [1jehuang/jcode-desktop](https://github.com/1jehuang/jcode-desktop). Download: [jcode.sh/desktop](https://jcode.sh/desktop).

Early notes — not dogfooded here yet. Core binary notes: [core.md](core.md).

## Install

Grab a build from [jcode.sh/desktop](https://jcode.sh/desktop). The remote machine (or local host) still needs a compatible `jcode` on PATH for agent sessions (`jcode api --stdio` on remotes).

From a sibling Jcode checkout (dev):

```shell
cargo run -p jcode-desktop
```

## Surfaces

Spatial canvas of session panels (chat, terminals, remotes). Machines / SSH targets open as native chat panels, not terminal wrappers.

### Single-panel

```shell
jcode-desktop --single-panel
```

One chat panel in its own native window (no workspace sidebar/tabs). Each invocation is a new window. `--resume` opens that window at the session browser.

### Voice / Jev

Microphone beside the composer. Hold the platform voice key to transcribe live; release to let **Jev** route the utterance (send/queue agent work, navigate, or keep uncertain input in the draft). Click or **Ctrl+Shift+V** as fallback. Details: upstream [voice routing](https://github.com/1jehuang/jcode-desktop/blob/master/docs/voice-session-navigation.md).

### Self-dev hot reload

In a Desktop self-dev checkout, **Ctrl+R** rebuilds and hot-reloads UI without closing the window. Agent sessions in that checkout use Desktop-specific self-dev (separate from CLI/TUI selfdev). See upstream [desktop self-dev](https://github.com/1jehuang/jcode-desktop/blob/master/docs/desktop-selfdev.md).

## Links

- [Download](https://jcode.sh/desktop)
- [Desktop guide](https://github.com/1jehuang/jcode-desktop/blob/master/docs/desktop-guide.md)
- [Single-panel](https://github.com/1jehuang/jcode-desktop/blob/master/docs/single-panel.md)
- [SDK](https://jcode.sh/sdk)
