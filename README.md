# wiki-mintlify-template

Publish a [Wiki CLI](https://github.com/wazootech/wiki)-compatible vault with [Mintlify](https://mintlify.com/) or Holocron. Edit semantic markdown in `wiki/`; validate with `wiki check`; sync to `docs/` for docs-site deploy.

Registry: [Wiki CLI templates](https://github.com/wazootech/wiki/blob/main/docs/wiki/Wiki_CLI.md#ecosystem-templates).

## Quick start

```bash
pip install wazootech-wiki
wiki check --strict
bash scripts/sync-docs.sh
npx mintlify dev
```

## Layout

| Path | Role |
| ---- | ---- |
| `wiki/` | Semantic vault (Wiki CLI source of truth) |
| `wiki.yaml` | Wiki CLI config |
| `scripts/sync-docs.sh` | Strip wiki frontmatter → `docs/*.md` for Mintlify |
| `docs/` | Mintlify site (`docs.json`, pages) |

## Workflow

1. Author in `wiki/` with typed frontmatter and Markdown links.
2. Run `wiki check --strict` (and `wiki lint --strict` in CI).
3. Run `scripts/sync-docs.sh` before Mintlify preview or deploy.
4. Connect the repo to Mintlify or export `docs/` to Holocron.

## CI

GitHub Actions runs `wiki check --strict`, `wiki lint --strict`, and `scripts/sync-docs.sh` on every push.

## Related

- [#31](https://github.com/wazootech/wiki/issues/31)
- [Wiki Configuration](https://github.com/wazootech/wiki/blob/main/docs/wiki/Wiki_Configuration.md)
