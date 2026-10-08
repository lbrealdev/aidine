# Hermes, Grok Bot, and White Noise

Sources: [whitenoise.chat](https://www.whitenoise.chat/), [Marmot protocol](https://www.whitenoise.chat/docs/marmot/README.md), [Connect your agent](https://www.whitenoise.chat/agents), [notmandatory/hermes-marmot](https://github.com/notmandatory/hermes-marmot), [unsaltedbutter-ai/hermes-nostr](https://github.com/unsaltedbutter-ai/hermes-nostr).

[White Noise](https://www.whitenoise.chat/) is a private messenger on Nostr. It runs on the [Marmot protocol](https://www.whitenoise.chat/docs/marmot/README.md): MLS-based end-to-end encryption for one-to-one and group chats, Nostr public keys as identity, and relays for delivery. White Noise and relay operators cannot read message content.

## Setup shape

Per [White Noise agents](https://www.whitenoise.chat/agents):

- Hermes runs on your machine through a Marmot/Nostr gateway.
- You use White Noise on the phone.
- Each agent shows up as an npub contact.
- You chat with Hermes from the phone.

Agents sit in the same contact list as people, and [White Noise](https://www.whitenoise.chat/) supports group chats, so multiple agents can share one conversation. A public X thread by @yuvlero shows Hermes and [Grok Bot](../grok/bot.md) chatting over White Noise (@whitenoisechat). URL not confirmed here.

Not tried here yet. No install walkthrough on this page.

## Connectors

- [notmandatory/hermes-marmot](https://github.com/notmandatory/hermes-marmot): Hermes gateway plugin to message the agent over Marmot. The path that talks to White Noise.
- [unsaltedbutter-ai/hermes-nostr](https://github.com/unsaltedbutter-ai/hermes-nostr): separate Hermes gateway plugin for Nostr NIP-17 private DMs (any NIP-17 client such as Damus, Amethyst, Snort). Not Marmot, not White Noise.
