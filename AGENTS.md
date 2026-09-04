# Agent notes for aidine

Notes on coding agents, LLMs, and MCP. Markdown is the source of truth. Auxiliary `scripts/` automate installs documented in the notes; they stay linked from the notes and do not replace the doc commands.

## Contribution flow

Issue → branch → PR. See [CONTRIBUTING.md](CONTRIBUTING.md).

- Open an issue, branch from up-to-date `main`, PR into `main`.
- Put `Closes #N` in the PR body.
- Do not commit or merge directly on `main`.
- Do not rewrite the two bootstrap commits on `main`.

## Conventions

This file is the single home for conventions and repo rules. Do not put duplicate convention sections in per-directory READMEs.

- Plain markdown. No front-matter.
- Terse prose.
- Use ` ```shell ``` ` blocks for commands.

## Scope

Documentation and auxiliary `scripts/` only. Keep scripts linked from the notes; the markdown remains authoritative.
