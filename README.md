# wiki-mintlify-template

Publish a [Wiki CLI](https://github.com/wazootech/wiki)-compatible vault with [Mintlify](https://mintlify.com).

Edit semantic markdown in `wiki/`; validate with `wiki check`; sync to `.mdx` for docs-site deploy.

Registry: [Wiki CLI templates](https://github.com/wazootech/wiki/blob/main/docs/wiki/Wiki_CLI.md#ecosystem-templates).

## Quick start

```bash
pip install wazootech-wiki
wiki check --strict
npm run sync
npm run dev
```

## Layout

| Path | Role |
| ---- | ---- |
| `wiki/` | Semantic vault (Wiki CLI source of truth) |
| `wiki.yaml` | Wiki CLI config |
| `scripts/sync-docs.sh` | Strip wiki frontmatter → `*.mdx` for Mintlify |
| `*.mdx` | Mintlify pages (generated from `wiki/` + static pages) |
| `docs.json` | Mintlify navigation and theme config |

## Scripts

| Command | Description |
| ------- | ----------- |
| `npm run dev` | Start local Mintlify preview |
| `npm run validate` | Validate Mintlify build |
| `npm run sync` | Sync wiki source → `.mdx` pages |
| `npm run export` | Static export to `dist/` |

## Workflow

1. Author in `wiki/` with typed frontmatter and Markdown links.
2. Run `wiki check --strict` (and `wiki lint --strict` in CI).
3. Run `npm run sync` to regenerate `.mdx` pages.
4. Preview locally with `npm run dev`, then push.

## Deploy

Two options depending on whether you want full Mintlify features or a free static site on Vercel.

### Option A: Mintlify Hosting (full-featured)

1. Go to [app.mintlify.com](https://app.mintlify.com) and sign in.
2. Click **Import from GitHub** and select this repository.
3. Mintlify auto-detects `docs.json` and the `.mdx` pages — no extra config needed.
4. Set your custom domain under **Settings → Domain** in the Mintlify dashboard.

On every push to `main`, CI validates your wiki and syncs pages. Mintlify redeploys automatically.

### Option B: Vercel Static Export (free, limited)

Deploys the static export (`mint export`) to Vercel without Mintlify hosting.

**Limitations:** No built-in search, API playground, or AI assistant. Updates require a Git push — no web editor.

1. Push this repo to GitHub.
2. Go to [vercel.com](https://vercel.com) → **Add New Project** → Import your repo.
3. Vercel reads `vercel.json` — build command and output directory are pre-configured.
4. Click **Deploy**.

On subsequent pushes, Vercel auto-deploys via Git integration.

**Preview locally:** `npm run export && npx serve dist`

## CI

GitHub Actions runs `wiki check --strict`, `wiki lint --strict`, and `npm run sync` on every push.

## Related

- [#31](https://github.com/wazootech/wiki/issues/31)
- [Wiki Configuration](https://github.com/wazootech/wiki/blob/main/docs/wiki/Wiki_Configuration.md)
