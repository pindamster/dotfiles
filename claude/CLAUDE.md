# Global Rules

## Commits
- Never use more than a single line for commits
- Always use Conventional Commits
- You MUST NOT mention Claude Code in any doc or commit

## Code Style
- Never use emojis in code, comments, commit messages, or documentation
- When writing German text, always use proper Unicode umlauts (ä, ö, ü, ß) -- never ASCII substitutes (ae, oe, ue, ss)

## Knowledge Base (Obsidian Vault at ~/AIVault)

The vault at `~/AIVault/` is the centralized knowledge base. All documentation goes there, NOT to local folders in project repos. Vault updates happen exclusively through skills (`/explain`, `/session`, `/plan-doc`, `/decision`) - never write to the vault automatically.

### Vault Structure
- `~/AIVault/projects/{project-slug}/` - Project-specific docs (plans, explanations, sessions, state)
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
2. Check the `## Plans` section for plans with status `approved` or `in-progress`
3. If open plans exist, present them and ask which to work on (or start something new)
4. If continuing a plan, read the full plan from the vault and resume from unchecked steps

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
