# Hugging Face

The Hub, the `hf` CLI, and the `huggingface_hub` Python library. Provider and tooling. Not a coding agent.

Sources: [huggingface.co](https://huggingface.co), [Hub docs](https://huggingface.co/docs/huggingface_hub), [CLI guide](https://huggingface.co/docs/huggingface_hub/en/guides/cli), [huggingface/huggingface_hub](https://github.com/huggingface/huggingface_hub).

## Install

No `hf` tool in the mise registry. `uv` is, and the CLI guide runs the [`hf` package](https://pypi.org/project/hf/) with `uvx`:

```shell
mise x uv -- uvx hf --help
```

Standalone installer, if `hf` should be on `PATH`. Not a mise package. `hf update` upgrades it.

```shell
curl -LsSf https://hf.co/cli/install.sh | bash
```

`pip install -U huggingface_hub` installs the library and the same `hf` command. Python 3.10+. `python` is in the mise registry.

## Auth

Default is a browser device flow: the CLI prints a URL and a short code.

```shell
mise x uv -- uvx hf auth login
```

Non-interactive, token from the environment (do not paste a token):

```shell
mise x uv -- uvx hf auth login --token "$HF_TOKEN"
```

Tokens are read, write, or fine-grained. Create them at [Settings → Access Tokens](https://huggingface.co/settings/tokens). The active token is saved at `~/.cache/huggingface/token`.

## Download

```shell
mise x uv -- uvx hf download Qwen/Qwen3-0.6B
```

`hf download <repo_id>` stores the snapshot in the Hub cache. Python uses the same cache via `hf_hub_download` and `snapshot_download`. Layout: [Manage cache](https://huggingface.co/docs/huggingface_hub/en/guides/manage-cache). A local inference server consumes that snapshot.

## Links

- [huggingface.co](https://huggingface.co)
- [Hub docs](https://huggingface.co/docs/huggingface_hub)
- [CLI guide](https://huggingface.co/docs/huggingface_hub/en/guides/cli)
- [huggingface/huggingface_hub](https://github.com/huggingface/huggingface_hub)
- [`hf skills add`](https://huggingface.co/docs/hub/en/agents-cli)
