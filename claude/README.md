# Claude Code config

Dotbot links `CLAUDE.md` and `settings.json` into `~/.claude/`. Skills are **not**
in this repo -- they live in their own repository which *is* `~/.claude/skills`.

## Skills

Authored skills live in [`pindamster/claude-skills`](https://github.com/pindamster/claude-skills),
cloned directly to `~/.claude/skills`. Each top-level directory there is one skill
(`<name>/SKILL.md`), because Claude Code scans `~/.claude/skills/<name>/` exactly
one level deep.

Third-party skills installed via `npx skills` land in `~/.agents/skills/` and are
symlinked alongside the authored ones. The skills repo's `.gitignore` ignores every
top-level entry and re-includes the authored folders by name, so those symlinks stay
untracked.

### Why skills are not vendored here

`~/.claude/skills` must be a **real directory**. The `skills` CLI writes **relative**
symlinks (`../../.agents/skills/<name>`), which only resolve when their parent is the
real `~/.claude/skills`. Pointing it at a directory inside this repo makes the relative
path resolve from the repo's physical location instead, so the links dangle and Claude
Code silently skips those skills.

## Herdr integration

The `hooks.SessionStart` entry in `settings.json` is **written by herdr**, not by hand.
Herdr installs `~/.claude/hooks/herdr-agent-state.sh` (marked `managed by herdr`, carrying
an integration version) and registers the hook here. Because `settings.json` is symlinked
into this repo, herdr edits the tracked file directly, so the entry reappears after every
integration update -- leave it minified as herdr writes it to keep the diff empty.

The hook script itself is deliberately **not** vendored here: herdr overwrites it on update,
and it no-ops unless `HERDR_ENV`, `HERDR_SOCKET_PATH`, and `HERDR_PANE_ID` are set. On a new
machine, herdr reinstalls it.

## New machine

```sh
./install                                   # dotbot links CLAUDE.md and settings.json
git clone git@github.com:pindamster/claude-skills.git ~/.claude/skills
npx skills@latest add mattpocock/skills     # third-party skills
```

If `~/.claude/skills` already exists with content, init in place instead of cloning:

```sh
cd ~/.claude/skills
git init -b main
git remote add origin git@github.com:pindamster/claude-skills.git
git fetch origin && git reset --hard origin/main   # untracked npx symlinks untouched
```
