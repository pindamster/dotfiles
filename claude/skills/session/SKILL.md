---
name: session
description: Create a session log summarizing this coding session and update the project state in the Obsidian vault
argument-hint: "[project-slug or 'general']"
---

Create a session log summarizing this coding session and update the project state.

## Target Detection
Same as /explain: check $ARGUMENTS first, then classify based on **what the session work was about** (not just the working directory). Work on vault templates, skills, `~/.claude/` config, or general tooling -> use `general`. Project-specific code/features/bugs -> detect from working directory. Fallback to general.

## Steps
1. Read the session template at `~/AIVault/_templates/session.md`
2. Create session log at `~/AIVault/projects/{project-slug}/sessions/YYYY-MM-DD.md`
   (or `~/AIVault/general/sessions/YYYY-MM-DD.md`)
   If a file for today already exists, append a `-N` suffix
3. Fill in YAML frontmatter
4. Review git log, files changed, and conversation context to fill in:
   - Goal of the session
   - What was done (with specifics)
   - Commits made
   - Issues encountered
   - State after session
5. Use **full-path wiki-links with display names**: `[[path/to/file|Display Name]]`
6. Add a `## Related` section with cross-links to related vault documents
7. Update `~/AIVault/projects/{project-slug}/state/{slug}-status.md` with fresh state
   - Project examples: `sfdb-status.md`, `general-status.md`
8. Update the relevant `{scope}-home.md` MOC
9. If ideas were captured to the backlog during this session, mention them in the session log (each idea has its own idea file linked from the backlog)
10. If any backlog items were completed during this session, move them to `## Done` in the backlog and update the corresponding idea file's `status` frontmatter (`done`, `planned`, or `wont-do`)
11. If roadmap milestones were completed, update the roadmap (check off items, move current-position marker)

## Formatting
Reference the `obsidian-markdown` skill for Obsidian-flavored markdown conventions.
