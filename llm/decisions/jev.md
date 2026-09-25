# Jev

TypeSafe Jev is hosted (not open weights). [jevtypesafeai.com](https://www.jevtypesafeai.com/), [docs](https://docs.typesafe.ai/introduction).

## PPQ

`POST https://api.ppq.ai/v1/decisions` (also `POST https://api.ppq.ai/v1/systemone`).

Same PayPerQ API key in the `Authorization` header. Input tokens are billed; output tokens are free. Not OpenAI-compatible — do not send it to `/v1/chat/completions`.

Pinned model id `typesafe/jev-1.13`. Rolling id `~typesafe/jev-latest` (leading tilde).

List models: `GET https://api.ppq.ai/v1/decisions/models`.

SDK `@typesafe-ai/sdk` with `baseURL: "https://api.ppq.ai"` and the PPQ key.

## Hosts

TypeSafe native is a separate host:

- `POST https://api.typesafe.ai/v1/systemone`
- `TYPESAFE_API_KEY` from [console.typesafe.ai](https://console.typesafe.ai)
- Model ids `jev-latest` / `jev-1.13.0` (no `typesafe/` prefix)
- $0.042 per 1M input tokens; output free
- 64k combined context, text only; English is the strong language

```shell
pip install typesafe-sdk
```

[jevtypesafeai.com](https://www.jevtypesafeai.com/) is a third host. Do not treat its rate or ids as PPQ or as [docs.typesafe.ai](https://docs.typesafe.ai/introduction):

- `POST https://jevtypesafeai.com/api/v1/decide`
- Keys `jv_live_...`
- Models `jev-latest` / `jev-1.13.0`
- Published input price $0.42/1M standard credits

## Ecosystem

- [hermes-jev-plugin](https://github.com/ajensenwaud/hermes-jev-plugin). TypeSafe key; default model `jev-latest`.

    ```shell
    hermes plugins install ajensenwaud/hermes-jev-plugin
    ```

- [fast-jev-compaction](https://github.com/tamaratran/fast-jev-compaction)
- [jev-use](https://github.com/shitianfang/jev-use)

    ```shell
    npx -y jev-use install
    ```

- [shipwithjev](https://www.shipwithjev.com/)
- [Setup guide](https://docs.typesafe.ai/introduction/quickstart.md)

## Vercel AI Gateway

As of 2026-09-25, [Jev on AI Gateway](https://vercel.com/changelog/typesafe-ai-jev-now-available-on-ai-gateway) is `typesafe-ai/jev`, $0.042/1M input, no output charge. Gateway examples use question type `boolean` (not `noul`).

Jaggedness: [jev-1.13](https://docs.typesafe.ai/model-jaggedness/jev-1.13.md).
