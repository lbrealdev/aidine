# Laya

Open-weight, non-autoregressive System 1 decision model family. Same typed `choice` / `score` / `noul` shape as Jev. Not a chat LLM.

Open weights for local self-host. Jev is a hosted API. Laya is not a drop-in for that API.

## Install

PyPI package `laya` (currently 0.3.20, Apache-2.0, Python >=3.10). Pulls `torch`, `transformers`, and `huggingface_hub`.

```shell
pip install laya
```

## Checkpoints

Separate Hub repos:

- [`convaiinnovations/laya`](https://huggingface.co/convaiinnovations/laya) — English, ModernBERT-large, 421M, context 512
- [`convaiinnovations/laya-multilingual`](https://huggingface.co/convaiinnovations/laya-multilingual) — mmBERT-base, 322M, context 1024, up to 8192 with `max_len=8192`
- [`convaiinnovations/laya-typed-decisions`](https://huggingface.co/convaiinnovations/laya-typed-decisions) — ModernBERT-large, 421M, context 1024, specialist workflows

## Router

Router is the entry point.

```python
from laya import Router

router = Router()
result = router.predict(state, questions)
```

`Router(preload=True)` loads all three. `model="multilingual"` or `model="typed-decisions"` overrides routing.

## Limits

Base English checkpoint 0.362 vs fine-tuned `laya-typed-decisions` 0.766 on the upstream typed-decisions benchmark. That score is a specialist fine-tune, not a zero-shot oracle. [PyPI](https://pypi.org/project/laya/).

[Honest Limitations](https://laya.convaiinnovations.com/): choice quality drops above ~20 options. The English checkpoint can be confidently wrong on non-Latin scripts. The Router must pick the multilingual checkpoint. Confidence is not a language detector.

## Elsewhere

- [decision-tools](https://github.com/callebtc/decision-tools) — tools on vendored `laya-mlx` and SemIf. Not the Laya install path.
- [laya-mlx](https://github.com/mizorewww/laya-mlx) — independent MLX port (`pip install laya-mlx`), Apple Silicon. Not an official ConvAI release.
