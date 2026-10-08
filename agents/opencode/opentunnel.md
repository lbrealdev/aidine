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

## OpenCode

[@thdxr](https://x.com/thdxr/status/2107956848318177622) announced OpenCode integration as coming. The [site](https://opentunnel.xyz/) already shows OpenCode as an example local target.

## Install entry points

Named only; not tried here yet. No walkthrough on this page.

- Install script: `https://opentunnel.xyz/install` ([site](https://opentunnel.xyz/), [repo](https://github.com/anomalyco/opentunnel))
- SDK package: [`@opentunnel/client`](https://github.com/anomalyco/opentunnel) (`packages/client`)
