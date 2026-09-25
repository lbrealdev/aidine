# Hugging Face

The Hub, the `hf` CLI, and the `huggingface_hub` Python library. Provider and tooling. Not a coding agent.

Sources: [huggingface.co](https://huggingface.co), [Hub docs](https://huggingface.co/docs/huggingface_hub), [huggingface/huggingface_hub](https://github.com/huggingface/huggingface_hub).

## Install

Standalone installer:

```shell
curl -LsSf https://hf.co/cli/install.sh | bash
```

Or the library, which also installs the CLI:

```shell
pip install huggingface_hub
```

`huggingface_hub` 2.0 does not install `huggingface-cli`. The CLI command is `hf`.

Upgrade an existing CLI:

```shell
hf update
```

## Auth

Default is a browser device flow: the CLI prints a URL and a short code.

```shell
hf auth login
```

Non-interactive, token from the environment (do not paste a token):

```shell
hf auth login --token $HF_TOKEN
```

Tokens are read, write, or fine-grained. Create them at [Settings → Access Tokens](https://huggingface.co/settings/tokens). The active token is saved at `~/.cache/huggingface/token`.

## Download

```shell
hf download Qwen/Qwen3-0.6B
```

`hf download <repo_id>` stores the snapshot in the Hub cache. Python uses the same cache via `hf_hub_download` and `snapshot_download`. Layout: [Manage cache](https://huggingface.co/docs/huggingface_hub/en/guides/manage-cache). A local inference server consumes that snapshot.

## Links

- [huggingface.co](https://huggingface.co)
- [Hub docs](https://huggingface.co/docs/huggingface_hub)
- [CLI guide](https://huggingface.co/docs/huggingface_hub/en/guides/cli)
- [huggingface/huggingface_hub](https://github.com/huggingface/huggingface_hub)
- [`hf skills add`](https://huggingface.co/docs/hub/en/agents-cli)
