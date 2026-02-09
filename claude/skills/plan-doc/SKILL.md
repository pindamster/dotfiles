---
name: plan-doc
description: Create a plan document in the Obsidian vault before starting implementation
argument-hint: "<topic> [project-slug or 'general']"
---

Create a plan document in the Obsidian vault for: $ARGUMENTS

## Target Detection
Same as /explain: check $ARGUMENTS for project slug, then classify based on **what the work is about** (not just the working directory). Vault/skills/tooling work -> `general`. Project-specific work -> detect from working directory. Fallback to general.

## Steps
1. Read the plan template at `~/AIVault/_templates/plan.md`
2. Determine a kebab-case slug from the topic
3. Write to `~/AIVault/projects/{project-slug}/plans/{slug}.md`
   (or `~/AIVault/general/plans/{slug}.md`)
4. Fill in YAML frontmatter: date, tags, status (draft), **execution-status (draft)**, project, type (plan)
5. Fill in: Objective, Current State, Proposed Approach, **Implementation Steps** (with `- [ ]` checkboxes), Trade-offs, Acceptance Criteria
6. Use **full-path wiki-links with display names**: `[[path/to/file|Display Name]]`
7. Add a `## Related` section with cross-links to related vault documents
8. Update the relevant `{scope}-home.md` MOC
9. **Update the project's state file** (`{slug}-status.md`) `## Plans` table with a new row:
   `| [[path/to/plan\|Plan Name]] | \`draft\` | One-line summary |`

## Formatting
Reference the `obsidian-markdown` skill for Obsidian-flavored markdown conventions.
