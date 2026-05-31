# Claude Code config

Dotbot links `CLAUDE.md` and `settings.json` into `~/.claude/`. Skills are
handled separately because `~/.claude/skills` must be a **real directory**, not
a symlink into this repo.

## Skills

Two independent sources populate `~/.claude/skills`:

- **Authored skills** — versioned here under `skills/*`, one folder per skill
  (each with a `SKILL.md`). Add a skill by dropping a new folder in `skills/`.
- **Installed skills** — fetched into `~/.agents/skills/` by the `skills` CLI,
  e.g. `npx skills@latest add mattpocock/skills`. These are NOT vendored here;
  reinstall them on a new machine with the command above.

`setup-skills.sh` is the bridge: it makes `~/.claude/skills` a real directory
and symlinks every folder from both sources into it (authored skills win on a
name clash). It runs automatically as a dotbot shell step and is idempotent.

### Why not symlink `~/.claude/skills` straight to `skills/`

The `skills` CLI writes **relative** symlinks (`../../.agents/skills/<name>`)
into `~/.claude/skills`. Those only resolve when their parent is the real
`~/.claude/skills`. If `~/.claude/skills` is itself a symlink into this repo,
the relative path resolves from the repo's physical location instead, dangles,
and Claude Code silently skips the skill.

## New machine

1. `./install` — dotbot links config and runs `setup-skills.sh` (authored skills).
2. `npx skills@latest add mattpocock/skills` — installed skills; rerun
   `./claude/setup-skills.sh` (or `./install`) afterward to link them.
