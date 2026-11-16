This is my attempt at creating my own stack.
The initial starting point is based on tstack by Theo with additions from pstack by poteto (aka Lauren)

## What's in it

All skills live in one flat `skills/` folder, so they install with one copy.

- **tstack** by Theo ([t3dotgg/tstack](https://github.com/t3dotgg/tstack)).
  Nine skills that carry a change to a merged PR: `full-send`, `full-stop`,
  `council`, `sol-loop`, `file-pr`, `babysit-pr`, `takeover`, `modernize`,
  `leaving-pr-comments`. See [upstream/tstack/README.md](upstream/tstack/README.md).
- **pstack** by poteto (Lauren Tan), from the harness-neutral mirror
  [backnotprop/pstack](https://github.com/backnotprop/pstack) of
  [cursor/plugins/pstack](https://github.com/cursor/plugins/tree/main/pstack).
  58 skills for rigorous engineering work. Start with `poteto-mode`. See
  [upstream/pstack/README.md](upstream/pstack/README.md) and the
  [guide](docs/guide/README.md).

`docs/` and `agents/` come from pstack, whose skills link to them.
`upstream/` keeps everything else each project ships, and the commit it came
from, for reference. None of it is installed.

## Install

```bash
git clone https://github.com/dkstjrgus/tstack-fork
cp -R tstack-fork/skills/* ~/.claude/skills/   # Claude Code
cp -R tstack-fork/skills/* ~/.codex/skills/    # Codex
```

Then run `setup-pstack` once to pick models per role. tstack's requirements
still apply: an authenticated `gh`, `python3` for `babysit-pr`, and other
providers' models for `council` and `sol-loop` (T3 Code's `delegate_task`
does this).

## Updating from upstream

`scripts/sync-upstream.sh [tstack-ref] [pstack-ref]` copies both projects into
this layout exactly as published (default: each one's `main`). Run it on an
`upstream` branch that holds no local edits, commit, then merge that branch
into `main`. Git then applies only what changed upstream and keeps edits made
on `main`.

## License

MIT. See [LICENSE](LICENSE). The original licenses are in `upstream/`.
