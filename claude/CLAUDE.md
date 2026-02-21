# Global Rules

## Commits
- Never use more than a single line for commits
- Always use Conventional Commits
- You MUST NOT mention Claude Code in any doc or commit

## Code Style
- Never use emojis in code, comments, commit messages, or documentation
- When writing German text, always use proper Unicode umlauts (ä, ö, ü, ß) -- never ASCII substitutes (ae, oe, ue, ss)

## Knowledge Base (Obsidian Vault at ~/AIVault)

The vault at `~/AIVault/` is the centralized knowledge base. All documentation goes there, NOT to local folders in project repos. Vault updates happen exclusively through skills (`/explain`, `/session`, `/plan-doc`, `/decision`, `/topic`) - never write to the vault automatically.

### Vault Structure
- `~/AIVault/projects/{project-slug}/` - Project-specific docs (plans, explanations, sessions, ideas, state)
- `~/AIVault/topics/{topic-slug}/` - Non-coding research & explorations (tech comparisons, hardware, life topics). Each topic is a subfolder with a main `{slug}.md` file. Use `/topic` to create/update.
- `~/AIVault/general/` - Non-project work (tooling, setup, learning)
- `~/AIVault/cross-cutting/` - Knowledge spanning multiple projects
- `~/AIVault/_templates/` - Document templates

### Document Rules
- Every document MUST have YAML frontmatter with: date, tags, status, project, type
- Use **full-path wiki-links with display names**: `[[path/to/file|Display Name]]`
- Use kebab-case for all file names
- All filenames must be **globally unique** across the vault (prefix with project slug if needed)
- No files named `_index.md` - use `{scope}-home.md` for MOC notes (e.g., `sfdb-home.md`, `general-home.md`)
- Tag every document with at least: the project name and the document type
- Every content document should have a `## Related` section with cross-links to related vault documents
- After creating a new vault document, update the relevant `{scope}-home.md` MOC

### Project Slug Mapping
- `service_forecast_databricks` -> `service-forecast-databricks`
- `eg_pricing_crawler` -> `eg-pricing-crawler`

## Plan Lifecycle

### Session Start Protocol
When starting a session on a project:
1. Read the project's state file (`{slug}-status.md`)
2. If a roadmap exists (`{slug}-*-roadmap.md` in `state/`), read it
3. If a backlog exists (`{slug}-backlog.md` in `state/`), read it
4. Check the `## Plans` section for plans with status `approved` or `in-progress`
5. If a roadmap exists, briefly state where the project stands on the critical path
   - If the user's proposed task is an enhancement while critical-path items are open, mention it -- but do not block or redirect. The user decides.
6. If the backlog has inbox items, mention the count and offer to triage
   - Example: "3 ideas in the backlog inbox -- triage now or later?"
   - If "later" or no response, move on. Never block.
7. If open plans exist, present them and ask which to work on (or start something new)
8. If continuing a plan, read the full plan from the vault and resume from unchecked steps

### Plan Mode Protocol
During plan mode, `.claude/plans/` is the transient working draft (required by Claude Code).
Before calling ExitPlanMode, ALWAYS:
1. Write the finalized plan to the vault using `/plan-doc` conventions (proper Obsidian formatting, frontmatter with `execution-status`, wikilinks, checkboxes)
2. Update the project's state file `## Plans` table
3. Then call ExitPlanMode

The user never needs to invoke `/plan-doc` manually -- it happens automatically as part of finalizing any plan. The vault version is the source of truth. `.claude/plans/` is ephemeral and can be ignored after the session.

### Plan Execution Protocol
When executing an approved plan:
1. Set `execution-status` to `in-progress` in the vault plan's frontmatter
2. Work through `## Implementation Steps` in order
3. Check off completed steps (`- [ ]` -> `- [x]`) in the vault plan as you go
4. When all steps are done, set `execution-status` to `completed`
5. Use `/session` at end of session to log progress

### Backlog Convention

Every backlog item is backed by an **idea file**. If something is too trivial for an idea file, just do it directly instead of putting it in the backlog.

**Capture**: During any session, when the user mentions an idea or one emerges from the work, offer to add it to the project's backlog. If the user agrees:
1. Create an idea file at `projects/{slug}/ideas/YYYY-MM-DD-{slug}-{topic}-idea.md` using the idea template
2. Append a wikilink to the backlog Inbox: `- [ ] [[projects/{slug}/ideas/...-idea|Short Title]]`
Never interrupt the current task -- just note it and continue.

**Done formats**:
- Completed directly: `- [x] [[projects/{slug}/ideas/...-idea|Short Title]] (done)` -- also set idea status to `done`
- Promoted to plan: `- [x] [[projects/{slug}/ideas/...-idea|Short Title]] (plan: [[.../plans/...|Plan Name]])` -- also set idea status to `planned`
- Won't do: `- [x] [[projects/{slug}/ideas/...-idea|Short Title]] (wont-do)` -- also set idea status to `wont-do`

**Promotion to plan**: When an idea becomes a plan, set `idea:` in the plan frontmatter to the idea wikilink, update the idea status to `planned`, and move the backlog item to Done.

**Triage**: Happens at session start if inbox items exist. For each item: move to Backlog (ordered by importance), add to roadmap if strategic, suggest as plan if large, or move to Done if already resolved.

**Relationship to roadmap**: Don't duplicate roadmap items in the backlog. The backlog captures ideas that aren't on the roadmap *yet*. Triage may promote items to the roadmap. Roadmap items may optionally link to idea files or plans: `- [ ] Milestone ([[.../plans/...|Plan]])` or `([[.../ideas/...-idea|Idea]])`.
