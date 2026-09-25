# Buzz desktop

Packaged builds from the [latest release](https://github.com/block/buzz/releases/latest). Early notes — not dogfooded here yet.

Source: [block/buzz](https://github.com/block/buzz) README, "I just want to try the app".

| Platform | File |
|---|---|
| macOS (Apple Silicon) | `Buzz_<version>_aarch64.dmg` |
| macOS (Intel) | `Buzz_<version>_x64.dmg` |
| Linux (x86_64) | `Buzz_<version>_amd64.AppImage` or `Buzz_<version>_amd64.deb` |
| Windows (x64) | `Buzz_<version>_x64-setup_alpha-unsigned.exe` |

The Windows build is unsigned. SmartScreen may show "Windows protected your PC" on first launch.

By default the app connects to `ws://localhost:3000`. Set `BUZZ_RELAY_URL` before launching, or switch the relay from inside the app.

Own relay: [relay.md](relay.md). Agent CLI: [cli.md](cli.md).
