This is my attempt at creating my own stack.
The initial starting point is based on tstack by Theo with additions from pstack by poteto (aka Lauren)

## What's in it

All skills live in one flat `skills/` folder, so they install with one copy.
My work is mostly building documents and solving problems, so the stack keeps
tstack whole and only the parts of pstack that fit that work.

- **tstack** by Theo ([t3dotgg/tstack](https://github.com/t3dotgg/tstack)), all
  nine skills. They carry a change to a merged PR, and they win wherever the
  two stacks overlap: `full-send`, `full-stop`, `council`, `sol-loop`,
  `file-pr`, `babysit-pr`, `takeover`, `modernize`, `leaving-pr-comments`.
- **pstack** by poteto (Lauren Tan), from the harness-neutral mirror
  [backnotprop/pstack](https://github.com/backnotprop/pstack) of
  [cursor/plugins/pstack](https://github.com/cursor/plugins/tree/main/pstack).
  14 of its 58 skills for writing, framing problems, catching up, and keeping
  a decision trail: `unslop`, `technical-writing`, `bro`, `in-your-own-words`,
  `sharpen`, `ketchup`, `recall`, `show-me-your-work`, `reflect`, `how`,
  `why`, `teach`, `figure-it-out`, `automate-me`.
- **`principles`**, eight of pstack's principles merged into one skill and
  widened from code to any work.

[skills-cut.txt](skills-cut.txt) lists the 44 pstack skills left out. The sync
script skips them; delete a line to bring one back. `upstream/` keeps
everything else each project ships, including pstack's guide and subagents,
and the commit it came from. None of it is installed.

## Install

```bash
git clone https://github.com/dkstjrgus/tstack-fork
cp -R tstack-fork/skills/* ~/.claude/skills/   # Claude Code
cp -R tstack-fork/skills/* ~/.codex/skills/    # Codex
```

tstack's requirements apply: an authenticated `gh`, `python3` for `babysit-pr`, and other
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
