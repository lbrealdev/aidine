# OpenTunnel

Sources: [opentunnel.xyz](https://opentunnel.xyz/), [anomalyco/opentunnel](https://github.com/anomalyco/opentunnel), [@thdxr announcement](https://x.com/thdxr/status/2107956848318177622).

[OpenTunnel](https://opentunnel.xyz/) is a CLI and SDK from the OpenCode team (announced by [@thdxr](https://x.com/thdxr/status/2107956848318177622)). It gives any app on your machine a public `*.opentunnel.xyz` URL, reachable from anywhere.

## How it differs

Per [opentunnel.xyz](https://opentunnel.xyz/) and the [repo](https://github.com/anomalyco/opentunnel): the TLS private key is generated and kept on your machine. The relay routes by SNI (hostname in the TLS handshake) and forwards the encrypted stream. It never holds the private key and never sees plaintext. That is the opposite of a typical ngrok or classic Cloudflare Tunnel edge, where TLS terminates at the relay.

## Caveats

From the [privacy section](https://opentunnel.xyz/):

- Tunnel hostnames are public: certificates land in Certificate Transparency logs, so the hostname is discoverable.
- Route names are private (wildcard cert) but guessable. Do not treat them as auth.
- Put authentication in the service itself.

The [repo](https://github.com/anomalyco/opentunnel) says inbound TCP is still on temporary AWS relays until Cloudflare Spectrum with TLS passthrough. The private key stays on the client either way.

## OpenCode

[@thdxr](https://x.com/thdxr/status/2107956848318177622) announced OpenCode integration as coming. The [site](https://opentunnel.xyz/) already shows OpenCode as an example local target.

## Install entry points

Not tried here. No `opentunnel` entry in the mise registry. `rust` and `node` are. From the [repo](https://github.com/anomalyco/opentunnel):

```shell
curl -fsSL https://opentunnel.xyz/install | sh
mise x node -- npm install -g opentunnel
mise x rust -- cargo install opentunnel-cli
```

Also `brew install anomalyco/tap/opentunnel` and the AUR package `opentunnel-bin`. Prebuilt binaries are on the GitHub releases.

SDK: [`@opentunnel/client`](https://github.com/anomalyco/opentunnel) (`packages/client`). The npm name `opentunnel` is the CLI launcher (`packages/cli`).
