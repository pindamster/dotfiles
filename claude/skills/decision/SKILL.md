---
name: decision
description: Record an architectural decision in the Obsidian vault
argument-hint: "<decision title> [project-slug or 'general']"
---

Record an architectural decision: $ARGUMENTS

## Target Detection
Same as /explain: check $ARGUMENTS for project slug, then classify based on **what the work was about** (not just the working directory). Vault/skills/tooling work -> `general`. Project-specific work -> detect from working directory. Fallback to general.

## Steps
1. Append to `~/AIVault/projects/{project-slug}/state/{slug}-decisions.md`
   (or `~/AIVault/general/state/general-decisions.md`)
   - Project examples: `sfdb-decisions.md`, `general-decisions.md`
2. Format:

   ## YYYY-MM-DD: {Decision Title}
   **Context:** Why this decision was needed
   **Decision:** What was decided
   **Alternatives considered:** What else was evaluated
   **Consequences:** Expected impact

3. Use **full-path wiki-links with display names** when referencing other vault documents: `[[path/to/file|Display Name]]`
4. Update the relevant `{scope}-home.md` MOC if needed

## Formatting
Reference the `obsidian-markdown` skill for Obsidian-flavored markdown conventions.
